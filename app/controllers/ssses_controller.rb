class SssesController < ApplicationController
  before_action :set_sss, only: [:show, :edit, :update, :destroy]

  def index
    @ssses = Sss.all
  end

  def show
  end

  def new
    @sss = Sss.new
  end

  def edit
  end

  def create
    @sss = current_user.ssses.build(sss_params)
      if @sss.save
        #１日につきストレス値は最新の１件のみを保存するようにする（それ以外は削除）
        while Sss.where(user_id: current_user.id).where(created_at: @sss.created_at.in_time_zone.all_day).length >= 2 do
          Sss.where(user_id: current_user.id).where(created_at: @sss.created_at.in_time_zone.all_day).first.destroy
        end
        if Pss4.where(user_id: current_user.id).where(created_at: @sss.created_at.in_time_zone.all_day).length > 0
          Pss4.where(user_id: current_user.id).where(created_at: @sss.created_at.in_time_zone.all_day).last.destroy
        end
        redirect_to @sss, notice: '診断終了'
      else
        render :new
      end
  end

  def update
    if @sss.update(sss_params)
      redirect_to @sss, notice: '更新'
    else
      render :edit
    end
  end

  def destroy
    @sss.destroy
    redirect_to ssses_url, notice: '削除'
  end

  private
  def sss_params
    params.require(:sss).permit(:q1, :q2, :q3, :q4, :q5, :q6, :q7, :q8, :q9, :q10,
                                :q11, :q12, :q13, :q14, :q15, :q16, :q17, :q18, :q19, :q20,
                                :q21, :q22, :q23, :q24, :q25, :q26, :q27, :q28, :q29, :q30,
                                :q31, :q32, :q33, :q34, :q35, :q36, :q37, :q38, :q39, :q40,
                                :score, :action, :condition, :emotions, :user_id)
  end

  def set_sss
    @sss = Sss.find(params[:id])
  end
end
