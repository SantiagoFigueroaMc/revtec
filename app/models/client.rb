# frozen_string_literal: true

class Client < ApplicationRecord
  belongs_to :user
  has_many :addresses
  has_many :cars

  validates :name, presence: true
end
