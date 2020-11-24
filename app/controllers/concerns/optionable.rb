module Optionable
  def extract_params(params)
    options = {}

    options[:include] = extract_includes(params) if params[:includes].present?

    options
  end

  def extract_includes(params)
    includes_options = []
    splitted_params = params[:includes].split(',')

    splitted_params.each do |item|
      includes_options << item.to_sym
    end

    includes_options
  end
end
