class CarsController < ApplicationController
  before_action :set_car, only: %i[ show edit update destroy ]

  # POST /cars or /cars.json
  def create
    @client = Client.find(params[:client_id])
    @car = @client.cars.create(car_params)

    redirect_to client_path(@client)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_car
      @car = Car.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def car_params
      params.fetch(:car, {}).permit(:licence_plate, :client_id)
    end
end
