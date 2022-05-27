# frozen_string_literal: true

class PublicController < ApplicationController
  def home
    @clients = Client.all
  end
end
