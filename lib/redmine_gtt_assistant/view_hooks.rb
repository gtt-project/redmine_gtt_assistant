module RedmineGttAssistant
  class ViewHooks < Redmine::Hook::ViewListener

    render_on :view_layouts_base_html_head, inline: <<-END
        <%= stylesheet_link_tag 'gtt_assistant', plugin: 'redmine_gtt_assistant' %>
        <%= javascript_include_tag 'gtt_assistant', plugin: 'redmine_gtt_assistant' %>
    END

    # render_on :view_issues_sidebar_issues_bottom,
    #   partial: "hooks/issue_assistant_sidebar"

    render_on :view_issues_form_details_bottom,
      partial: "hooks/issue_assistant_buttons"

  end
end
