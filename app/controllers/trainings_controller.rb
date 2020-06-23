class TrainingsController < ApplicationController
  before_action :set_training, only: [:show, :update, :destroy]

  # GET /trainings
  def index
    authenticate_user!

    @trainings = current_user.trainings

    render json: @trainings.to_json(include: :exercises)
  end

  # GET /trainings/1
  def show
    authenticate_user!
    render json: @training.to_json(include: [:exercises, :client, :trainer])
  end

  # POST /trainings
  def create
    authenticate_trainer!
    @training = Training.new(training_params)

    if @training.save
      render json: @training.to_json(include: :exercises), status: :created, location: @training
    else
      render json: @training.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /trainings/1
  def update
    authenticate_trainer!
    if @training.update(training_params)
      render json: @training.to_json(include: :exercises)
    else
      render json: @training.errors, status: :unprocessable_entity
    end
  end

  # DELETE /trainings/1
  def destroy
    authenticate_trainer!
    @training.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_training
      @training = current_user.trainings.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def training_params
      params.require(:training).permit(:client_id, :kind, :division, :date_start, :date_end, exercises_attributes: [:name, :description, :times, :series, :_destroy, :id]).merge(trainer: current_trainer)
    end
end
