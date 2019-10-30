class Big5ScoresController < ApplicationController
  before_action :authenticate_user!
  before_action :set_big5_score, only: [:show]
  before_action :last_time_big5_score, only: [:show]
  before_action :this_time_big5_score, only: [:show]

  def show
  end

  def new
    @big5_score = Big5Score.new
  end

  def create
    @big5_score = current_user.big5_scores.build(big5_score_params)
    if @big5_score.save
      # 前回分と今回分以外の古いスコアは削除する
      while Big5Score.where(user_id: current_user.id).length >= 3 do
        Big5Score.where(user_id: current_user.id).first.destroy
      end
      redirect_to @big5_score
    else
      render :new
    end
  end

  private

  def big5_score_params
    params.require(:big5_score).permit(:q1, :q2, :q3, :q4, :q5, :q6, :q7, :q8, :q9, :q10, :user_id)
  end

  def set_big5_score
    @big5_score = Big5Score.find(params[:id])
  end
end
