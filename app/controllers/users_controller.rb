class UsersController < ApplicationController
  before_action :set_user #, only: [:show, :edit, :update, :destroy]
  before_action :last_time_big5_score, only: [:show, :diary_data]
  before_action :this_time_big5_score, only: [:show, :diary_data]
  before_action :my_stress_diaries, only: [:show, :diary_data]
  before_action :authenticate_user! #, only: [:new, :edit, :update, :destroy]

  def show
    @dailry_data = StressDiary.where(user_id: current_user).order(created_at: :desc) + Pss4.where(user_id: current_user) + Sss.where(user_id: current_user)
    @stress_scores = (Pss4.where(user_id: current_user).order(:created_at).limit(50) + Sss.where(user_id: current_user).order(:created_at).limit(50)).pluck(:score, :created_at, :q40).sort_by { |_, b| b }
    total_scores = 0
    @stress_scores.each do |score|
      if score[2] != nil && score[0] >= 5
        total_scores += ((score[0]).to_f / 10)
      else
        total_scores += score[0]
      end
    end
    @average_score = (total_scores.to_f / @stress_scores.length).round
    @total_diary = StressDiary.where(user_id: current_user)
  end

  def dailry_data
    @date = params[:para]

    words = params[:q].delete(:duration_or_situation_or_trigger_or_reaction_cont) if params[:q].present?
    if words.present?
      params[:q][:groupings] = []
      words.split(/[ 　]/).each_with_index do |word, i|
        params[:q][:groupings][i] = { duration_or_situation_or_trigger_or_reaction_cont: word }
      end
    end
    @query = StressDiary.where(created_at: params[:para].in_time_zone.all_day).where(user_id: current_user).ransack(params[:q])
    @dailry_stress_diaries = @query.result(distinct: true).page(params[:page]).per(10).where(user_id: current_user.id).order(created_at: :desc)

    begin
      if Pss4.where(created_at: params[:para].in_time_zone.all_day).where(user_id: current_user).last == nil && Sss.where(created_at: params[:para].in_time_zone.all_day).where(user_id: current_user).last != nil
        @dailry_stress_score = Sss.where(created_at: params[:para].in_time_zone.all_day).where(user_id: current_user).last
      else
        @dailry_stress_score = Pss4.where(created_at: params[:para].in_time_zone.all_day).where(user_id: current_user).last.score
      end
    rescue
      @dailry_stress_score = nil
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :gender, :age, :email, :password, :password_confirmation, :user_id, :para, :q, :page, :groupings)
  end

  def set_user
    @user = User.find(current_user.id) if user_signed_in?
  end

end
