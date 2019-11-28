class UsersController < ApplicationController
  def index
    @users = 
      case params[:scope]
      when 'authors'
        User.with_published_subjects
      when 'vips'
        User.vips
      when 'admins'
        User.admins
      else
        User.all
      end.paginate(page: params[:page])
         .order('username ASC')
  end

  def show
    @user = User.friendly.find(params[:id])
  end

  private
end