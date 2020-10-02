class IndexController < ApplicationController
  def index
    render json: {
      name: 'lorier (Logistic Courier) API',
      version: '1.0.0'
    }.to_json
  end
end
