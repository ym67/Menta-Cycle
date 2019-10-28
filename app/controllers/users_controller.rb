class UsersController < ApplicationController
  before_action :set_user #, only: [:show, :edit, :update, :destroy]
  before_action :last_time_big5_score, only: [:show, :diary_data]
  before_action :this_time_big5_score, only: [:show, :diary_data]
  before_action :my_stress_diaries, only: [:show, :diary_data]
  before_action :authenticate_user! #, only: [:new, :edit, :update, :destroy]

  def show
    @dailry_data = StressDiary.where(user_id: current_user).order(id: :desc) + Pss4.where(user_id: current_user) + Sss.where(user_id: current_user)
    @stress_scores = (Pss4.where(user_id: current_user).order(:created_at).limit(50) + Sss.where(user_id: current_user).order(:created_at).limit(50)).pluck(:score, :created_at, :q40).sort_by { |_, b| b }
  end

  def dailry_data
    @date = params[:para]
    @dailry_stress_diaries = StressDiary.where(created_at: params[:para].in_time_zone.all_day).where(user_id: current_user).order(id: :desc)
    if Pss4.where(created_at: params[:para].in_time_zone.all_day).where(user_id: current_user).last == nil && Sss.where(created_at: params[:para].in_time_zone.all_day).where(user_id: current_user).last != nil
      # @dailry_stress_score = ((Sss.where(created_at: params[:para].in_time_zone.all_day).where(user_id: current_user).last.score).to_f / 10)
      @dailry_stress_score = Sss.where(created_at: params[:para].in_time_zone.all_day).where(user_id: current_user).last
    else
      @dailry_stress_score = Pss4.where(created_at: params[:para].in_time_zone.all_day).where(user_id: current_user).last.score
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :gender, :age, :email, :password, :password_confirmation, :user_id)
  end

  def set_user
    @user = User.find(current_user.id) if user_signed_in?
  end

end
