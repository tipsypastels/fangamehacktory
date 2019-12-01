class SubjectAdminController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_topic

  def pin
    set_pinned true
  end

  def unpin
    set_pinned false
  end

  private

  def set_pinned(pinned)
    if @topic.update pinned: pinned
      flash[:success] = "The #{@topic.term} is now #{@topic.pinned? ? 'pinned' : 'unpinned'}"
    else
      flash[:error] = "Failed to set #{@topic.term} pin."
    end

    redirect_to topic_path(@topic)
  end

  def set_topic
    @topic = Topic.friendly.find(params[:id])
  end
end