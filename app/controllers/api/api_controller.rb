class Api::ApiController < ApplicationController
  before_action :validate_api_key!

  private
    def has_valid_api_key?
      User.where(api_key: request.headers['X-Api-Key']).any?
    end

    def validate_api_key!
      render status: 403, json: {
        message: "Invalid API key"
      } unless has_valid_api_key?
    end
end
