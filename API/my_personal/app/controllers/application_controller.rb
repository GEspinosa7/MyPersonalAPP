class ApplicationController < ActionController::API
	before_action :authenticate_trainer!

	def authenticate_trainer!
		if current_trainer
			return head(401)
		end
	end

	def current_trainer
		@current_trainer ||= Trainer.find_by uid: request.headers['token'] 
	end

end
