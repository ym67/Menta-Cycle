# conding: utf-8

# ユーザ
User.create!(
  [
    {
      name: '管理者(seed)',
      gender: true,
      age: "20",
      email: 'admin1@seed.com',
      password: '000000',
      created_at: DateTime.current,
      updated_at: DateTime.current,
      admin: true
    },
    {
      name: '一般ユーザ（seed）',
      gender: true,
      age: "20",
      email: 'test1@seed.com',
      password: '000000',
      created_at: DateTime.current,
      updated_at: DateTime.current,
      admin: false
    }
  ]
)

# Big5
Big5Score.create!(
  [
    {
      user_id: 1,
      q1: 2, q2: 2, q3: 2, q4: 2, q5: 2, q6: 2, q7: 2, q8: 2, q9: 2, q10: 2,
      created_at: DateTime.current,
      updated_at: DateTime.current,
    },
    {
      user_id: 1,
      q1: 1, q2: 1, q3: 1, q4: 1, q5: 1, q6: 1, q7: 1, q8: 1, q9: 1, q10: 1,
      created_at: DateTime.current - 1.days,
      updated_at: DateTime.current - 1.days,
    },
    {
      user_id: 2,
      q1: 2, q2: 2, q3: 2, q4: 2, q5: 2, q6: 2, q7: 2, q8: 2, q9: 2, q10: 2,
      created_at: DateTime.current,
      updated_at: DateTime.current,
    },
    {
      user_id: 2,
      q1: 1, q2: 1, q3: 1, q4: 1, q5: 1, q6: 1, q7: 1, q8: 1, q9: 1, q10: 1,
      created_at: DateTime.current - 1.days,
      updated_at: DateTime.current - 1.days,
    }
  ]
)

# ストレスダイアリー
StressDiary.create!(
  [
    {
      user_id: 1,
      time: Time.current,
      stress_level: 1,
      duration: "30〜40分",
      situation: "テスト",
      trigger: "テスト",
      reaction: "テスト",
      created_at: DateTime.current,
      updated_at: DateTime.current,
    },
    {
      user_id: 1,
      time: Time.current,
      stress_level: 1,
      duration: "30〜40分",
      situation: "テスト",
      trigger: "テスト",
      reaction: "テスト",
      created_at: DateTime.current - 1.days,
      updated_at: DateTime.current - 1.days,
    },
    {
      user_id: 1,
      time: Time.current,
      stress_level: 1,
      duration: "30〜40分",
      situation: "テスト",
      trigger: "テスト",
      reaction: "テスト",
      created_at: DateTime.current - 2.days,
      updated_at: DateTime.current - 2.days,
    },
    {
      user_id: 1,
      time: Time.current,
      stress_level: 1,
      duration: "30〜40分",
      situation: "テスト",
      trigger: "テスト",
      reaction: "テスト",
      created_at: DateTime.current - 3.days,
      updated_at: DateTime.current - 3.days,
    },
    {
      user_id: 1,
      time: Time.current,
      stress_level: 1,
      duration: "30〜40分",
      situation: "テスト",
      trigger: "テスト",
      reaction: "テスト",
      created_at: DateTime.current - 4.days,
      updated_at: DateTime.current - 4.days,
    },
    {
      user_id: 2,
      time: Time.current,
      stress_level: 2,
      duration: "〜10分",
      situation: "テスト",
      trigger: "テスト",
      reaction: "テスト",
      created_at: DateTime.current,
      updated_at: DateTime.current,
    },
    {
      user_id: 2,
      time: Time.current,
      stress_level: 2,
      duration: "〜10分",
      situation: "テスト",
      trigger: "テスト",
      reaction: "テスト",
      created_at: DateTime.current - 1.days,
      updated_at: DateTime.current - 1.days,
    },
    {
      user_id: 2,
      time: Time.current,
      stress_level: 2,
      duration: "〜10分",
      situation: "テスト",
      trigger: "テスト",
      reaction: "テスト",
      created_at: DateTime.current - 2.days,
      updated_at: DateTime.current - 2.days,
    },
    {
      user_id: 2,
      time: Time.current,
      stress_level: 2,
      duration: "〜10分",
      situation: "テスト",
      trigger: "テスト",
      reaction: "テスト",
      created_at: DateTime.current - 3.days,
      updated_at: DateTime.current - 3.days,
    },
    {
      user_id: 2,
      time: Time.current,
      stress_level: 2,
      duration: "〜10分",
      situation: "テスト",
      trigger: "テスト",
      reaction: "テスト",
      created_at: DateTime.current - 4.days,
      updated_at: DateTime.current - 4.days,
    }
  ]
)

# Pss4（簡易ストレスチェック）
Pss4.create!(
  [
    {
      user_id: 1,
      q1: 10, q2: 10, q3: 10, q4: 10,
      created_at: DateTime.current,
      updated_at: DateTime.current,
    },
    {
      user_id: 1,
      q1: 20, q2: 20, q3: 20, q4: 20,
      created_at: DateTime.current - 1.days,
      updated_at: DateTime.current - 1.days,
    },
    {
      user_id: 1,
      q1: 10, q2: 10, q3: 10, q4: 10,
      created_at: DateTime.current - 2.days,
      updated_at: DateTime.current - 2.days,
    },
    {
      user_id: 1,
      q1: 20, q2: 20, q3: 20, q4: 20,
      created_at: DateTime.current - 3.days,
      updated_at: DateTime.current - 3.days,
    },
    {
      user_id: 1,
      q1: 10, q2: 10, q3: 10, q4: 10,
      created_at: DateTime.current - 4.days,
      updated_at: DateTime.current - 4.days,
    }
  ]
)

# Sss（詳細ストレスチェック）
Sss.create!(
  [
    {
      user_id: 2,
      q1: 1, q2: 1, q3: 1, q4: 1, q5: 1, q6: 1, q7: 1, q8: 1, q9: 1, q10: 1,
      q11: 1, q12: 1, q13: 1, q14: 1, q15: 1, q16: 1, q17: 1, q18: 1, q19: 1, q20: 1,
      q21: 1, q22: 1, q23: 1, q24: 1, q25: 1, q26: 1, q27: 1, q28: 1, q29: 1, q30: 1,
      q31: 1, q32: 1, q33: 1, q34: 1, q35: 1, q36: 1, q37: 1, q38: 1, q39: 1, q40: 1,
      created_at: DateTime.current,
      updated_at: DateTime.current,
    },
    {
      user_id: 2,
      q1: 2, q2: 2, q3: 2, q4: 2, q5: 2, q6: 2, q7: 2, q8: 2, q9: 2, q10: 2,
      q11: 2, q12: 2, q13: 2, q14: 2, q15: 2, q16: 2, q17: 2, q18: 2, q19: 2, q20: 2,
      q21: 2, q22: 2, q23: 2, q24: 2, q25: 2, q26: 2, q27: 2, q28: 2, q29: 2, q30: 2,
      q31: 2, q32: 2, q33: 2, q34: 2, q35: 2, q36: 2, q37: 2, q38: 2, q39: 2, q40: 2,
      created_at: DateTime.current - 1.days,
      updated_at: DateTime.current - 1.days,
    },
    {
      user_id: 2,
      q1: 1, q2: 1, q3: 1, q4: 1, q5: 1, q6: 1, q7: 1, q8: 1, q9: 1, q10: 1,
      q11: 1, q12: 1, q13: 1, q14: 1, q15: 1, q16: 1, q17: 1, q18: 1, q19: 1, q20: 1,
      q21: 1, q22: 1, q23: 1, q24: 1, q25: 1, q26: 1, q27: 1, q28: 1, q29: 1, q30: 1,
      q31: 1, q32: 1, q33: 1, q34: 1, q35: 1, q36: 1, q37: 1, q38: 1, q39: 1, q40: 1,
      created_at: DateTime.current - 2.days,
      updated_at: DateTime.current - 2.days,
    },
    {
      user_id: 2,
      q1: 2, q2: 2, q3: 2, q4: 2, q5: 2, q6: 2, q7: 2, q8: 2, q9: 2, q10: 2,
      q11: 2, q12: 2, q13: 2, q14: 2, q15: 2, q16: 2, q17: 2, q18: 2, q19: 2, q20: 2,
      q21: 2, q22: 2, q23: 2, q24: 2, q25: 2, q26: 2, q27: 2, q28: 2, q29: 2, q30: 2,
      q31: 2, q32: 2, q33: 2, q34: 2, q35: 2, q36: 2, q37: 2, q38: 2, q39: 2, q40: 2,
      created_at: DateTime.current - 3.days,
      updated_at: DateTime.current - 3.days,
    },
    {
      user_id: 2,
      q1: 1, q2: 1, q3: 1, q4: 1, q5: 1, q6: 1, q7: 1, q8: 1, q9: 1, q10: 1,
      q11: 1, q12: 1, q13: 1, q14: 1, q15: 1, q16: 1, q17: 1, q18: 1, q19: 1, q20: 1,
      q21: 1, q22: 1, q23: 1, q24: 1, q25: 1, q26: 1, q27: 1, q28: 1, q29: 1, q30: 1,
      q31: 1, q32: 1, q33: 1, q34: 1, q35: 1, q36: 1, q37: 1, q38: 1, q39: 1, q40: 1,
      created_at: DateTime.current - 4.days,
      updated_at: DateTime.current - 4.days,
    }
  ]
)
