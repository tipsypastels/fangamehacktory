class SettingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user 

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:avatar, :age, :gender, :location, :occupation, :biography, avatars: [])
  end

  def set_user
    @user = Current.user
  end
end