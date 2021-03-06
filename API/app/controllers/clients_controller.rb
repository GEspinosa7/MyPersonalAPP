class ClientsController < ApplicationController
  before_action :authenticate_user!, except: :create
  before_action :set_client, only: [:me, :update, :destroy]

  # GET /clients
  def index
    authenticate_trainer!

    @trainer = current_trainer

    @clients = @trainer.clients.all

    render json: @clients
    
  end
  
  # GET /clients/me
  def me
    render json: @client
  end

  # POST /clients
  def create
    @client = Client.new(client_params)

    if @client.save
      render json: @client, status: :created, location: @client
    else
      render json: @client.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /clients/1
  def update
    if @client.update(client_params)
      render json: @client
    else
      render json: @client.errors, status: :unprocessable_entity
    end
  end

  # DELETE /clients/1
  def destroy
    @client.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = current_client  
    end

    # Only allow a trusted parameter "white list" through.
    def client_params
      params.require(:client).permit(:uid, :name, :lastname, :birth_date, :weight, :height, :goal, :time_active, :availability, :picture)
    end
end
