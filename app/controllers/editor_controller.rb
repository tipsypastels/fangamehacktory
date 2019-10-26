class EditorController < ApplicationController
  before_action :set_topic
  before_action :authenticate_editor!
  
  def edit
    redirect_to "/edit/#{@topic.slug}/#{EDITOR_PAGES[0]}"
  end

  EDITOR_PAGES = %i|settings fields|
  EDITOR_PAGES.each { |page| define_method(:"edit_#{page}") {} }

  def update
    if @topic.update(topic_params)
      redirect_to topic_path(@topic)
    else
      render 'edit'
    end
  end

  private

  def set_topic
    @topic = Topic.friendly.find(params[:id])
  end

  def topic_params
    params.require(:topic).permit(:title, :description, :status, fields_attributes: {})
  end

  def authenticate_editor!
    unless @topic.editable?
      redirect_to topic_path(@topic)
    end 
  end
end