# frozen_string_literal: true

class CarsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_car, only: %i[show edit update destroy]

  # POST /cars or /cars.json
  def create
    @client = Client.find(params[:client_id])
    @car = @client.cars.create(car_params)

    redirect_to user_client_path(@client.user_id, @client.id)
  end

  # DELETE /addresses/1 or /addresses/1.json
  def destroy
    @car.destroy

    redirect_to user_client_path(@client.user_id, @client.id)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_car
    @user = User.find(current_user.id)
    @client = Client.find(params[:client_id])
    @car = @client.cars.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def car_params
    params.fetch(:car, {}).permit(:licence_plate, :client_id)
  end
end
