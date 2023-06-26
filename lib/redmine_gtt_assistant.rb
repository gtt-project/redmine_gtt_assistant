# Helper library to integrate the GTT Assistant with OpenAI
module RedmineGttAssistant
  # Setup method for initializing the GTT Assistant
  def self.setup
    RedmineGttAssistant::Openai.init
  end

  def self.default_settings
    Redmine::Plugin.find(:redmine_gtt_assistant).settings[:default]
  end

  # Return OPENAI_API_ACTIVE environment variable
  # If the environment variable is not set, fallback to 'false'
  def self.active
    ENV['OPENAI_API_ACTIVE'].presence || 'false'
  end

  # Return openai_model for OpenAI API
  def self.openai_model
    openai_model = Setting.plugin_redmine_gtt_assistant['openai_model'].presence || RedmineGttAssistant.default_settings['openai_model']
    return openai_model.to_s
  end

  # Return max_tokens for OpenAI API
  def self.max_tokens
    max_tokens = Setting.plugin_redmine_gtt_assistant['max_tokens'].presence || RedmineGttAssistant.default_settings['max_tokens']
    return max_tokens.to_i
  end

  # Return temperature for OpenAI API
  def self.temperature
    temperature = Setting.plugin_redmine_gtt_assistant['temperature'].presence || RedmineGttAssistant.default_settings['temperature']
    return temperature.to_f
  end

  # Return request timeout for HTTP requests
  def self.request_timeout
    request_timeout = Setting.plugin_redmine_gtt_assistant['request_timeout'].presence || RedmineGttAssistant.default_settings['request_timeout']
    return request_timeout.to_i
  end
end

