class Client < ApplicationRecord
    has_many :addresses
    has_many :cars
end
