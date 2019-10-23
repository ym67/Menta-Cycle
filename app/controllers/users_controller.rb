class UsersController < ApplicationController
  before_action :set_user #, only: [:show, :edit, :update, :destroy]
  before_action :last_time_big5_score, only: [:show, :diary_data]
  before_action :this_time_big5_score, only: [:show, :diary_data]
  before_action :my_stress_diaries, only: [:show, :diary_data]
  before_action :authenticate_user! #, only: [:new, :edit, :update, :destroy]

  def show
    @diarys = StressDiary.where(user_id: current_user)
  end

  def dailry_data
    @date = params[:para]
    @dailry_stress_diaries = StressDiary.where(created_at: params[:para].in_time_zone.all_day).where(user_id: current_user)
  end

  private

  def user_params
    params.require(:user).permit(:name, :gender, :age, :email, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(current_user.id) if user_signed_in?
  end

end
