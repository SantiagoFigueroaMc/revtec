# frozen_string_literal: true

class Client < ApplicationRecord
  has_many :addresses
  has_many :cars

  validates :name, presence: true
end
