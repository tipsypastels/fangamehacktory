class EditorController < ApplicationController
  before_action :set_subject
  before_action :authenticate_editor!
  
  def edit
    redirect_to "/edit/#{@subject.slug}/#{EDITOR_PAGES[0]}"
  end

  GLOBAL_EDITOR_PAGES = %i|settings statistics design|
  GLOBAL_EDITOR_PAGES.each { |page| define_method(:"edit_#{page}") {} }

  CONTEXTUAL_EDITOR_PAGES = {
    pokedex: ->subject { subject.subjected.respond_to? :pokedex }
  }

  CONTEXTUAL_EDITOR_PAGES.each { |page, allowed|
    define_method :"edit_#{page}" do
      unless allowed.call(@subject)
        redirect_to editor_path(@subject)
      end
    end
  }

  EDITOR_PAGES = [*GLOBAL_EDITOR_PAGES, *CONTEXTUAL_EDITOR_PAGES.keys]

  def update
    if @subject.update(subject_params)
      redirect_to subject_path(@subject)
    else
      render 'edit_settings'
    end
  end

  private

  def set_subject
    @subject = Subject.friendly.find(params[:id])
  end

  def subject_params
    params.require(:subject).permit(:title, :description, :status, :thumbnail, :avatar, fields_attributes: {}, polls_attributes: {})
  end

  def authenticate_editor!
    unless @subject.editable?
      redirect_to subject_path(@subject)
    end 
  end
end