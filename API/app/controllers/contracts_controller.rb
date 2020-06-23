class ContractsController < ApplicationController
  before_action :set_contract, only: [:show, :update, :destroy]

  # GET /contracts
  def index
    authenticate_user!

    @contracts = current_user.contracts

    render json: @contracts
  end

  # GET /contracts/1
  def show
    authenticate_user!
    render json: @contract.to_json(include: [:client, :trainer])
  end

  # POST /contracts
  def create
    authenticate_client!
    @contract = Contract.new(contract_params)

    if @contract.save
      render json: @contract, status: :created, location: @contract
    else
      # render json: @contract.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /contracts/1
  def update
    authenticate_user!
    if @contract.update(contract_params)
      render json: @contract
    else
      render json: @contract.errors, status: :unprocessable_entity
    end
  end

  # DELETE /contracts/1
  def destroy
    authenticate_user!
    @contract.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contract
      @contract = current_user.contracts.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def contract_params
      params.require(:contract).permit(:trainer_id, :start_date, :close_date).merge(client: current_client)
    end
end