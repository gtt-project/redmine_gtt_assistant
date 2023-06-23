# Require the GTT Assistant library
require ::File.expand_path('lib/redmine_gtt_assistant', __dir__)

# Global hooks
require File.expand_path('../lib/redmine_gtt_assistant/view_hooks', __FILE__)

# Register the Redmine plugin
Redmine::Plugin.register :redmine_gtt_assistant do
  # Set plugin metadata
  name 'Redmine GTT Assistant plugin'
  author 'Georepublic'
  author_url 'https://github.com/georepublic'
  url 'https://github.com/gtt-project/redmine_gtt_assistant'
  description 'Get some help from your smart assistant'
  version '0.1.0'

  # Define the minimum required Redmine version for this plugin
  requires_redmine :version_or_higher => '5.0.0'

  # Configure plugin settings with default values and a partial view for settings
  settings(
    default: {
      'openai_model' => 'gpt-3.5-turbo',
      'max_tokens' => 1000,
      'temperature' => 1.0,
      'request_timeout' => 120,
    },
    partial: 'gtt_assistant/settings'
  )

  # Define a project module for the GTT Assistant plugin
  project_module :gtt_assistant do
    # Set the permission required to view GTT Assistant
    permission :view_gtt_assistant, {}, :require => :loggedin
  end

end
