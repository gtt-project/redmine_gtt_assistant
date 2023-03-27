# frozen_string_literal: true

require ::File.expand_path('redmine_gtt_assistant/openai', __dir__)

# Helper library to integrate sentry
module RedmineGttAssistant

  def self.setup
  end

  # return OPENAI_API_ACTIVE environment variable.
  # If the environment variable is not set, fallback to false.
  def self.active
    if ENV['OPENAI_API_ACTIVE'].present?
      ENV['OPENAI_API_ACTIVE']
    else
      'false'
    end
  end

  def self.request_timeout
    Setting.plugin_redmine_gtt_assistant['request_timeout'].to_i || 120
  end

end

RedmineGttAssistant::Openai.init
