module ExceptionHandler
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound do |_e|
      render json: { message: 'resource_not_found' }, status: :not_found
    end
  end
end
