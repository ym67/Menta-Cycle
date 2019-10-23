class StressDiariesController < ApplicationController
  before_action :set_stress_diary, only: [:show, :edit, :update, :destroy]

  def index
    @stress_diaries = StressDiary.where(user_id: current_user.id)
  end

  def show
  end

  def new
    @stress_diary = StressDiary.new
  end

  def edit
  end

  def create
    @stress_diary = current_user.stress_diaries.build(stress_diary_params)
    if @stress_diary.save
      redirect_to @stress_diary, notice: '日記を投稿しました'
    else
      render :new
    end
  end

  def update
    if @stress_diary.update(stress_diary_params)
      redirect_to @stress_diary, notice: '日記を更新しました'
    else
      render :edit
    end
  end

  def destroy
    @stress_diary.destroy
    redirect_to stress_diaries_url, notice: '日記を削除しました'
  end

  private

  def stress_diary_params
    params.require(:stress_diary).permit(:time, :stress_level, :duration, :situation, :trigger, :reaction)
  end

  def set_stress_diary
    @stress_diary = StressDiary.find(params[:id])
  end
end
