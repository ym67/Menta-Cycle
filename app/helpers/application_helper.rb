module ApplicationHelper
  # 前回のBig5レコード
  def last_time_big5_score
    if user_signed_in? && Big5Score.where(user_id: current_user.id).length >= 2
      @last_time_big5_score = Big5Score.where(user_id: current_user.id).first
      # 項目別スコア
      ## 誠実性
      @last_time_conscientiousness      = (@last_time_big5_score.q3 + (8 - @last_time_big5_score.q8 ).to_f) / 2
      ## 協調性
      @last_time_agreeableness          = (@last_time_big5_score.q7 + (8 - @last_time_big5_score.q2 ).to_f) / 2
      ## 情緒安定性
      @last_time_neuroticism            = (@last_time_big5_score.q9 + (8 - @last_time_big5_score.q4 ).to_f) / 2
      ## 開放性
      @last_time_openness_to_experience = (@last_time_big5_score.q5 + (8 - @last_time_big5_score.q10).to_f) / 2
      ## 外向性
      @last_time_extraversion           = (@last_time_big5_score.q1 + (8 - @last_time_big5_score.q6 ).to_f) / 2
    else
      @last_time_conscientiousness      = 0
      ## 協調性
      @last_time_agreeableness          = 0
      ## 情緒安定性
      @last_time_neuroticism            = 0
      ## 開放性
      @last_time_openness_to_experience = 0
      ## 外向性
      @last_time_extraversion           = 0
    end
  end

  # 今回のBig5レコード
  def this_time_big5_score
    if user_signed_in? && Big5Score.where(user_id: current_user.id).length  >= 1
      @this_time_big5_score = Big5Score.where(user_id: current_user.id).last
      # 項目別スコア
      ## 誠実性
      @this_time_conscientiousness      = (@this_time_big5_score.q3 + (8 - @this_time_big5_score.q8 ).to_f) / 2
      ## 協調性
      @this_time_agreeableness          = (@this_time_big5_score.q7 + (8 - @this_time_big5_score.q2 ).to_f) / 2
      ## 情緒安定性
      @this_time_neuroticism            = (@this_time_big5_score.q9 + (8 - @this_time_big5_score.q4 ).to_f) / 2
      ## 開放性
      @this_time_openness_to_experience = (@this_time_big5_score.q5 + (8 - @this_time_big5_score.q10).to_f) / 2
      ## 外向性
      @this_time_extraversion           = (@this_time_big5_score.q1 + (8 - @this_time_big5_score.q6 ).to_f) / 2
    else
      @last_time_conscientiousness      = 0
      ## 協調性
      @last_time_agreeableness          = 0
      ## 情緒安定性
      @last_time_neuroticism            = 0
      ## 開放性
      @last_time_openness_to_experience = 0
      ## 外向性
      @last_time_extraversion           = 0
    end
  end

  #自分のストレスダイアリー
  def my_stress_diaries
    @my_stress_diaries = StressDiary.where(user_id: current_user.id)
  end
end
