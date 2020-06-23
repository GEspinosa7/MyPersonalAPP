class Client < ApplicationRecord
    has_one_attached :picture
	has_many :trainings
	has_many :contracts
   	has_many :trainers, through: :contracts
end
