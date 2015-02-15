class PreQuestionnaire < ActiveRecord::Base
	validates :name, :gender, :age, :reason, :background, :experience, :hobbies, :order_id, presence: true
end
