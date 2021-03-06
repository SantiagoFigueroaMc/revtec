# frozen_string_literal: true

class AddressesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_address, only: %i[show edit update destroy]

  # GET /addresses or /addresses.json
  def index
    @addresses = @client.addresses
  end

  # GET /addresses/1/edit
  def edit; end

  # POST /addresses or /addresses.json
  def create
    @client = Client.find(params[:client_id])
    @address = @client.addresses.create(address_params)

    redirect_to user_client_path(@client.user_id, @client.id)
  end

  # PATCH/PUT /addresses/1 or /addresses/1.json
  def update
    respond_to do |format|
      if @address.update(address_params)
        format.html { redirect_to user_client_path(@client.user_id, @client.id), notice: 'Address was successfully updated.' }
        format.json { render :show, status: :ok, location: @address }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /addresses/1 or /addresses/1.json
  def destroy
    @address.destroy

    
    redirect_to user_client_path(@client.user_id, @client.id)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_address
    @user = User.find(params[:user_id])
    @client = @user.clients.find(params[:client_id])
    @address = @client.addresses.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def address_params
    params.fetch(:address, {}).permit(:street, :city, :state, :number, :details, :client_id)
  end
end
