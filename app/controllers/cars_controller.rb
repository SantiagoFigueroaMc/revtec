# frozen_string_literal: true

class CarsController < ApplicationController
  before_action :set_car, only: %i[show edit update destroy]

  # POST /cars or /cars.json
  def create
    @client = Client.find(params[:client_id])
    @car = @client.cars.create(car_params)

    redirect_to client_path(@client)
  end

  # DELETE /addresses/1 or /addresses/1.json
  def destroy
    @client = Client.find(@car.client_id)
    @car.destroy

    respond_to do |format|
      format.html { redirect_to @client, notice: 'Car was successfully destroyed.' }
      format.json { head :no_content }
    end
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
