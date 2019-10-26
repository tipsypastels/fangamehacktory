class UsersController < ApplicationController
  def index
    @users = 
      case params[:scope]
      when 'publishers'
        User.with_published_topics
      when 'admins'
        User.admins
      else
        User.all
      end.alphabetical
  end

  def show
    @user = User.friendly.find(params[:id])
  end
end