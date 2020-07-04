class RatingsController < ApplicationController
  before_action :set_rating, only: [:show]

  # GET /ratings
  def index
    authenticate_user!

    @ratings = current_trainer.ratings

    render json: @ratings.to_json(include: [:client, :trainer])
  end

  # GET /ratings/1
  def show
    authenticate_user!
    
    render json: @ratings.to_json(include: [:client, :trainer])
  end

  # POST /ratings
  def create
    authenticate_client!

    @rating = Rating.new(rating_params)

    if @rating.save
      render json: @rating, status: :created, location: @rating
    else
      render json: @rating.errors, status: :unprocessable_entity
    end
  end

  # # PATCH/PUT /ratings/1
  # def update
  #   if @rating.update(rating_params)
  #     render json: @rating
  #   else
  #     render json: @rating.errors, status: :unprocessable_entity
  #   end
  # end

  # # DELETE /ratings/1
  # def destroy
  #   @rating.destroy
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rating
      @rating = current_trainer.ratings.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def rating_params
      params.require(:rating).permit(:trainer_id, :rating_date, :rating_value).merge(client: current_client)
    end
end
