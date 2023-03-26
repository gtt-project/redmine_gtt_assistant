# Register the Redmine plugin
Redmine::Plugin.register :redmine_gtt_assistant do
  # Plugin metadata
  name 'Redmine GTT Assistant plugin'
  author 'Georepublic'
  author_url 'https://github.com/georepublic'
  url 'https://github.com/gtt-project/redmine_gtt_assistant'
  description 'Get some help from your smart assistant'
  version '0.1.0'

  # Specify the minimum required Redmine version
  requires_redmine :version_or_higher => '5.0.0'

  # Plugin settings with default values and partial view for settings
  settings(
    default: {},
    partial: 'gtt_assistant/settings'
  )
end
