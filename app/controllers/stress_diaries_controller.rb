class StressDiariesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_stress_diary, only: [:edit, :update, :destroy]

  def index
    words = params[:q].delete(:duration_or_situation_or_trigger_or_reaction_cont) if params[:q].present?
    if words.present?
      params[:q][:groupings] = []
      words.split(/[ 　]/).each_with_index do |word, i|
        params[:q][:groupings][i] = { duration_or_situation_or_trigger_or_reaction_cont: word }
      end
    end
    @query = StressDiary.where(user_id: current_user.id).ransack(params[:q])
    @stress_diaries = @query.result(distinct: true).page(params[:page]).per(10).where(user_id: current_user.id).order(created_at: :desc)
  end

  def new
    @stress_diary = StressDiary.new
  end

  def edit
  end

  def create
    @stress_diary = current_user.stress_diaries.build(stress_diary_params)
    if @stress_diary.save
      redirect_to stress_diaries_path, notice: 'ストレスダイアリーを投稿しました'
    else
      render :new
    end
  end

  def update
    if @stress_diary.update(stress_diary_params)
      redirect_to stress_diaries_path, notice: 'ストレスダイアリーを更新しました'
    else
      render :edit
    end
  end

  def destroy
    @stress_diary.destroy
    # redirect_to stress_diaries_url, notice: 'ストレスダイアリーを削除しました'
    redirect_to request.referer, notice: 'ストレスダイアリーを削除しました'
  end

  private

  def stress_diary_params
    params.require(:stress_diary).permit(:time, :stress_level, :duration, :situation, :trigger, :reaction, :user_id, :q, :page, :groupings)
  end

  def set_stress_diary
    @stress_diary = StressDiary.find(params[:id])
  end
end
