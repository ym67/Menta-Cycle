class Big5ScoresController < ApplicationController
  before_action :set_big5_score, only: [:show, :edit, :update, :destroy]
  before_action :last_time_big5_score, only: [:show]
  before_action :this_time_big5_score, only: [:show]
  # before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]

  def index
    @big5_scores = Big5Score.where(user_id: current_user.id).order(id: "DESC")
  end

  def show
  end

  def new
    @big5_score = Big5Score.new
  end

  def edit
  end

  def create
    @big5_score = current_user.big5_scores.build(big5_score_params)
    if @big5_score.save
      # 前回分と今回分以外の古いスコアは削除する
      while Big5Score.where(user_id: current_user.id).length >= 3 do
        Big5Score.where(user_id: current_user.id).first.destroy
      end
      redirect_to @big5_score, notice: '診断終了'
    else
      render :new
    end
  end

  def update
    if @big5_score.update(big5_score_params)
      redirect_to @big5_score, notice: '更新'
    else
      render :edit
    end
  end

  def destroy
    @big5_score.destroy
    redirect_to big5_scores_url, notice: '削除'
  end

  private

  def big5_score_params
    params.require(:big5_score).permit(:q1, :q2, :q3, :q4, :q5, :q6, :q7, :q8, :q9, :q10, :user_id)
  end

  def set_big5_score
    @big5_score = Big5Score.find(params[:id])
  end
end
