json.array!(@pre_questionnaires) do |pre_questionnaire|
  json.extract! pre_questionnaire, :id, :name, :gender, :age, :reason, :background, :experience, :hobbies, :order_id
  json.url pre_questionnaire_url(pre_questionnaire, format: :json)
end
