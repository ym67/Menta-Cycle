class UsersController < ApplicationController
  before_action :set_user #, only: [:show, :edit, :update, :destroy]
  before_action :last_time_big5_score, only: [:show]
  before_action :this_time_big5_score, only: [:show]
  before_action :authenticate_user! #, only: [:new, :edit, :update, :destroy]

  def show
  end

  private

  def user_params
    params.require(:user).permit(:name, :gender, :age, :email, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(current_user.id) if user_signed_in?
  end

end
