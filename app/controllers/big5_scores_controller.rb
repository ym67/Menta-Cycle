class Big5ScoresController < ApplicationController
  before_action :set_big5_score, only: [:show, :edit, :update, :destroy]

  def index
    @big5_scores = Big5Score.all
  end

  def show
  end

  def new
    @big5_score = Big5Score.new
  end

  def edit
  end

  def create
    @big5_score = Big5Score.new(big5_score_params)

    if @big5_score.save
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

  def set_big5_score
    @big5_score = Big5Score.find(params[:id])
  end

  def big5_score_params
    params.require(:big5_score).permit(:q1, :q2, :q3, :q4, :q5, :q6, :q7, :q8, :q9, :q10)
  end

end
