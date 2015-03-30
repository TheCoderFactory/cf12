json.array!(@feedback_forms) do |feedback_form|
  json.extract! feedback_form, :id, :course_id, :location_id, :satisfaction, :recommend, :another, :achieve, :value, :best_part, :comments
  json.url feedback_form_url(feedback_form, format: :json)
end
