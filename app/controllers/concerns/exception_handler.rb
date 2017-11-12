module ExceptionHandler
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound do |e|
      json_response({ message: e.message }, :not_found)
    end

    rescue_from ActiveRecord::RecordInvalid do |e|
      first_error_message = e.message.split(", ")[0]
      display_message = first_error_message.slice(first_error_message.index(":") + 2..first_error_message.size - 1)
      json_response({ message: display_message }, :unprocessable_entity)
    end
  end
end