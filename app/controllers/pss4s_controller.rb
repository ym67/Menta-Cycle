class Pss4sController < ApplicationController
  before_action :set_pss4, only: [:show]

  def show
  end

  def new
    @pss4 = Pss4.new
  end

  def create
    @pss4 = current_user.pss4s.build(pss4_params)
    if @pss4.save
      #１日につきストレス値は最新の１件のみを保存するようにする（それ以外は削除）
      while Pss4.where(user_id: current_user.id).where(created_at: @pss4.created_at.in_time_zone.all_day).length >= 2 do
        Pss4.where(user_id: current_user.id).where(created_at: @pss4.created_at.in_time_zone.all_day).first.destroy
      end
      if Sss.where(user_id: current_user.id).where(created_at: @pss4.created_at.in_time_zone.all_day).length > 0
        Sss.where(user_id: current_user.id).where(created_at: @pss4.created_at.in_time_zone.all_day).last.destroy
      end
      redirect_to @pss4, notice: '診断終了'
    else
      render :new
    end
  end


  private

  def pss4_params
    params.require(:pss4).permit(:q1, :q2, :q3, :q4, :score, :user_id)
  end

  def set_pss4
    @pss4 = Pss4.find(params[:id])
  end
end
