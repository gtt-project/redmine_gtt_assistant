require 'openai'

module RedmineGttAssistant
  class Openai

    # Initialize Assistant
    def self.init
      # Check if the OpenAI integration is active.
      return if RedmineGttAssistant.active != 'true'

      OpenAI.configure do |config|
        config.access_token = ENV['OPENAI_API_KEY']
        config.organization_id = ENV['OPENAI_API_ORG']
        config.request_timeout = RedmineGttAssistant.request_timeout
      end
    end

    # Fetch the list of available models from the OpenAI API
    def self.fetch_api_models
      client = OpenAI::Client.new
      models = client.models.list
      model_ids = models['data'].map { |model| model['id'] }
      # model_ids.select! { |id| id.match(/^gpt.*|text-search.*/) }
      model_ids.select! { |id| id.match(/^gpt.*/) }
      return model_ids.sort!
    rescue StandardError => e
      Rails.logger.error("Error fetching API models from OpenAI: #{e}")
      return []
    end

  end
end

