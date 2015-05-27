class UserProfilesController < ApplicationController

  def index
    @teachers = User.all_teachers
  end

  def edit
    @user = User.find(params[:id])
    redirect_to root_path unless current_user.id == @user.id
  end

  def update
    if current_user.update(user_params)
      flash[:success] = t('flash.success')
      redirect_to user_profile_path
    else
      render :edit
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :second_name, :biography, :about,
                                 :avatar, :avatar_cache, :remove_avatar)
  end
end
