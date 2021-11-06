# frozen_string_literal: true

class ApplicationService
  # rescue RestClient::Exception, with: :rest_client_bad_request
    def self.call(*args, &block)
      new(*args, &block).call
    end

  private
  def rest_client_bad_request
    # Rails.logger.info(error.message)
    # Rails.logger.info(error.backtrace.join("\n")
    # { success: false, errors: error.messages }
    # flash[:notice] = "Sorry, something went wrong'"
    # redirect_to deviseuser_spotify_omniauth_callback_path
  end 
end