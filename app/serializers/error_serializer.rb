class ErrorSerializer
  include FastJsonapi::ObjectSerializer

  def serialized_json
    errors_response = @resource.messages.map do |attribute, errors|
      {
        title: 'Invalid Attribute',
        source: { parameter: attribute },
        details: errors
      }
    end

    { errors: errors_response }
  end
end