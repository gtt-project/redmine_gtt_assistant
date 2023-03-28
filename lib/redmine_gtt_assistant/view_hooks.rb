module RedmineGttAssistant
  class ViewHooks < Redmine::Hook::ViewListener
    # Include GTT Assistant stylesheets and JavaScript
    render_on :view_layouts_base_html_head, inline: <<-END
      <%= stylesheet_link_tag 'gtt_assistant', plugin: 'redmine_gtt_assistant' %>
      <%= javascript_include_tag 'gtt_assistant', plugin: 'redmine_gtt_assistant' %>
    END

    # Uncomment the following lines to render the issue assistant sidebar
    # render_on :view_issues_sidebar_issues_bottom,
    #   partial: "hooks/issue_assistant_sidebar"

    # Render GTT Assistant buttons on the issue form
    render_on :view_issues_form_details_bottom,
      partial: "hooks/issue_assistant_buttons"
  end
end
