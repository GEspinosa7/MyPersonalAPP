class Trainer < ApplicationRecord
	has_one_attached :picture
	has_many :trainings
	has_many :clients, through: :trainings
end
