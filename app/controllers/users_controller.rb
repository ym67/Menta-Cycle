class UsersController < ApplicationController
  before_action :set_user #, only: [:show, :edit, :update, :destroy]
  before_action :last_time_big5_score, only: [:show, :diary_data]
  before_action :this_time_big5_score, only: [:show, :diary_data]
  before_action :my_stress_diaries, only: [:show, :diary_data]
  before_action :authenticate_user! #, only: [:new, :edit, :update, :destroy]

  def show
    @dailry_data = StressDiary.where(user_id: current_user).order(id: :desc) + Pss4.where(user_id: current_user)
    @pss4_scores = Pss4.where(user_id: current_user).limit(31).pluck(:score, :created_at)
  end

  def dailry_data
    @date = params[:para]
    @dailry_stress_diaries = StressDiary.where(created_at: params[:para].in_time_zone.all_day).where(user_id: current_user).order(id: :desc)
    @dailry_pss4_score = Pss4.where(created_at: params[:para].in_time_zone.all_day).where(user_id: current_user).last
  end

  private

  def user_params
    params.require(:user).permit(:name, :gender, :age, :email, :password, :password_confirmation, :user_id)
  end

  def set_user
    @user = User.find(current_user.id) if user_signed_in?
  end

end
