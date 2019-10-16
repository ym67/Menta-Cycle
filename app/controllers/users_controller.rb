class UsersController < ApplicationController
  before_action :set_user #, only: [:show, :edit, :update, :destroy]

  def show
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :gender, :age, :email, :password, :password_confirmation)
  end

end
