class Pss4sController < ApplicationController
  before_action :set_pss4, only: [:show, :edit, :update, :destroy]

  def index
    @pss4s = Pss4.where(user_id: current_user.id).order(id: :desc)
  end

  def show
  end

  def new
    @pss4 = Pss4.new
  end

  def edit
  end

  def create
    @pss4 = current_user.pss4s.build(pss4_params)
    if @pss4.save
      #１日につきストレス値は最新の１件のみを保存するようにする（それ以外は削除）
      while Pss4.where(user_id: current_user.id).where(created_at: @pss4.created_at.in_time_zone.all_day).length >= 2 do
        Pss4.where(user_id: current_user.id).where(created_at: @pss4.created_at.in_time_zone.all_day).first.destroy
      end
      redirect_to @pss4, notice: '診断終了'
    else
      render :new
    end
  end

  def update
    if @pss4.update(pss4_params)
      redirect_to @pss4, notice: '更新'
    else
      render :edit
    end
  end

  def destroy
    @pss4.destroy
    redirect_to pss4s_url, notice: '削除'
  end

  private

  def pss4_params
    params.require(:pss4).permit(:q1, :q2, :q3, :q4, :user_id)
  end

  def set_pss4
    @pss4 = Pss4.find(params[:id])
  end
end
