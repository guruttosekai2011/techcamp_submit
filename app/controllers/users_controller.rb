class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @memos = current_user.memos
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    current_user.update(update_params)
  end

  private
  def update_params
    params.require(:user).permit(:nickname, :birth_year, :birth_month, :birth_day, :belonging, :facebookid, :twitterid, :introduction, :avatar)
  end

end
