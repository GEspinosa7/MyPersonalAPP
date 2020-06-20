class TrainersController < ApplicationController
  skip_before_action :authenticate_user!, only: :create
  before_action :set_trainer, only: [:me, :update, :destroy]


  # GET /trainers/me
  def me
    render json: @trainer
  end

  # POST /trainers
  def create
    @trainer = Trainer.new(trainer_params)

    if @trainer.save
      render json: @trainer, status: :created, location: @trainer
    else
      render json: @trainer.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /trainers/1
  def update
    if @trainer.update(trainer_params)
      render json: @trainer
    else
      render json: @trainer.errors, status: :unprocessable_entity
    end
  end

  # DELETE /trainers/1
  def destroy
    @trainer.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trainer
      @trainer = current_trainer
    end

    # Only allow a trusted parameter "white list" through.
    def trainer_params
      params.require(:trainer).permit(:name, :lastname, :birth_date, :time_acting, :qualifications, :availability, :price, :uid, :picture)
    end
end
