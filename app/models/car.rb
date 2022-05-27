# frozen_string_literal: true

class Car < ApplicationRecord
  belongs_to :client

  validates :licence_plate, presence: true
  validates :client_id, presence: true
end
