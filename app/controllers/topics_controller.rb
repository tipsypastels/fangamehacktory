class TopicsController < ApplicationController
  before_action :authenticate_user!, except: %i|show index|

  def index
    @pinned_topics = Topic.on_index_pinned
    @latest_topics = Topic.on_index_latest(params[:page])
  end

  def show
    @topic = Topic.friendly.find(params[:id])
  end

  def new
    @topic = Topic.new
  end

  def create
    if @topic = Topic.create(topic_params)
      redirect_to editor_path(@topic)
    else
      render 'new'
    end
  end

  private

  def topic_params
    params.require(:topic).permit(:title, :type, :description)
  end
end
