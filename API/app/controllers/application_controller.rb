class ApplicationController < ActionController::API
	
#auth
	def authenticate_user!
		return head(401) if current_user.nil?
	end

	def authenticate_trainer!
		return head(401) if current_trainer.nil?
	end

	def authenticate_client!
		return head(401) if current_client.nil?
	end

#both
	def current_user
		current_trainer or current_client
	end

# trainer
	def current_trainer
		@current_trainer ||= Trainer.find_by uid: request.headers['token'] 
	end

# client
	def current_client
		@current_client ||= Client.find_by uid: request.headers['token']
	end

end
