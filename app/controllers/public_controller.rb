# frozen_string_literal: true

class PublicController < ApplicationController
  def home
    @clients = Client.all
    @user = User.find(current_user.id)
  end

  def about
  end
end
