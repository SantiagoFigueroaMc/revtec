# frozen_string_literal: true

class Address < ApplicationRecord
  belongs_to :client

  validates :street, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :number, presence: true
  validates :client_id, presence: true
end
