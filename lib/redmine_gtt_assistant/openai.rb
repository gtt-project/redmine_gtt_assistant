require 'openai'

module RedmineGttAssistant
  class Openai
    # Initialize Assistant
    def self.init
      # Return if the OpenAI integration is not active
      return if RedmineGttAssistant.active != 'true'

      # Configure OpenAI API client
      OpenAI.configure do |config|
        config.access_token = ENV['OPENAI_API_KEY']
        config.organization_id = ENV['OPENAI_API_ORG']
        config.request_timeout = RedmineGttAssistant.request_timeout
        # config.request_timeout = 120
      end
    end

    # Fetch the list of available models from the OpenAI API
    def self.fetch_api_models
      client = OpenAI::Client.new
      models = client.models.list
      model_ids = models['data'].map { |model| model['id'] }
      model_ids.select! { |id| id.match(/^gpt.*/) }
      return model_ids.sort!
    rescue StandardError => e
      Rails.logger.error("Error fetching API models from OpenAI: #{e}")
      return []
    end

    # Single-turn task without any conversations
    def self.chat(params)
      client = OpenAI::Client.new
      response = client.chat(parameters: {
        model: RedmineGttAssistant.openai_model,
        max_tokens: RedmineGttAssistant.max_tokens,
        temperature: RedmineGttAssistant.temperature,
        messages: [
          { role: "system", content: params[:instruct] },
          { role: "user", content: params[:prompt] },
        ],
      })
      return response.dig("choices", 0, "message", "content").to_s
    rescue StandardError => e
      Rails.logger.error("Error submitting a request to OpenAI: #{e}")
      return []
    end
  end
end
