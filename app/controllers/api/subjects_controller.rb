class Api::SubjectsController < ApplicationController
  before_action :authenticate_user!, except: %i|show index|

  def types
    types = 
      case params[:context]&.to_sym
      when 'creatable'
        Subjected.types.creatable
      else
        Subjected.types.viewable
      end

    render json: types
  end

  def index
    @your_drafts = Subject.your_drafts
    @timeline = Subject.on_index(params[:page])
                       .of_type(params[:type])

    render json: {
      your_drafts: @your_drafts,
      timeline: @timeline,
    }
  end

  def show
    @subject = Subject.friendly.find(params[:id])
    @subject.views.create!
    render_for_api :public, json: @subject
  end

  def create
    @subject = Subject.create!(subject_params)

    if @subject.save
      redirect_to editor_path(@subject)
    else
      render 'new'
    end
  end

  private

  def subject_params
    params.require(:subject).permit(:title, :subjected_type, :tag_list, :description)
  end
end
