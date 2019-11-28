class SubjectsController < ApplicationController
  before_action :authenticate_user!, except: %i|show index|

  def index
    @subjects = Subject.on_index(params[:page])
  end

  def show
    @subject = Subject.friendly.find(params[:id])
    @subject.views.create!
  end

  def new
    @subject = Subject.new
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
    params.require(:subject).permit(:title, :subjected_type, :description)
  end
end
