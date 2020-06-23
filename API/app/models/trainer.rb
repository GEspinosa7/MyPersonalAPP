class Trainer < ApplicationRecord
	has_one_attached :picture
	has_many :trainings
	has_many :contracts
	has_many :clients, through: :contracts
end
