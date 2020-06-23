class Client < ApplicationRecord
    has_one_attached :picture
	has_many :trainings
   	has_many :trainers, through: :trainings
end
