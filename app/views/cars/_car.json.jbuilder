# frozen_string_literal: true

json.extract! car, :id, :created_at, :updated_at
json.url car_url(car, format: :json)
