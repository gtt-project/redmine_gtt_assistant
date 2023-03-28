class GttAssistantController < ApplicationController
  # Generate a subject based on the issue description
  def generate_subject
    response = RedmineGttAssistant::Openai.chat({
      "instruct": "Create the title of an issue based on its description in its original language. The title must be less than 80 characters long.",
      "prompt": params[:description]
    })
    render json: {
      success: true,
      message: 'Request successful.',
      answer: {
        subject: response.to_s.tr('"', '')
      }
    }
  end

  # Optimize the issue description considering Markdown formatting
  def optimize_description
    response = RedmineGttAssistant::Openai.chat({
      "instruct": "Improve the content of the issue description in its original language. Consider Markdown formatting.",
      "prompt": params[:description]
    })
    render json: {
      success: true,
      message: 'Request successful.',
      answer: {
        description: response.to_s.tr('"', '')
      }
    }
  end
end
