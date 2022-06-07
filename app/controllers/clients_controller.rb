# frozen_string_literal: true

class ClientsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_client, only: %i[show edit update destroy share]

  # GET /clients or /clients.json
  def index
    @user = User.find(params[:user_id])
    @clients = @user.clients.all
    @shared_clients = Client.where('shared = ? and user_id != ?', true, @user.id)
  end

  # GET /clients/1 or /clients/1.json
  def show
    @user = User.find(params[:user_id])
  end

  # GET /clients/new
  def new
    @user = User.find(params[:user_id])
    @client = Client.new
  end

  # GET /clients/1/edit
  def edit
    @user = User.find(params[:user_id])
  end

  # POST /clients or /clients.json
  def create
    @user = User.find(params[:user_id])
    @client = @user.clients.create(client_params)

    redirect_to user_clients_url(@user)
  end

  def share
    @user = User.find(params[:user_id])
    @client = Client.find(params[:id])
    if (@user.id == @client.user_id) then
      if @client.shared then
        @client.update(shared: false)
      else
        @client.update(shared: true)
      end
    end
  end

  # PATCH/PUT /clients/1 or /clients/1.json
  def update
    respond_to do |format|
      if @client.update(client_params)
        format.html { redirect_to client_url(@client), notice: 'Client was successfully updated.' }
        format.json { render :show, status: :ok, location: @client }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clients/1 or /clients/1.json
  def destroy
    @client.destroy

    respond_to do |format|
      format.html { redirect_to clients_url, notice: 'Client was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_client
    @client = Client.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def client_params
    params.fetch(:client, {}).permit(:name, :phone)
  end
end
