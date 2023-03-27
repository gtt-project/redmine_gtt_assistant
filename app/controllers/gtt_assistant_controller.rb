class GttAssistantController < ApplicationController

  def generateSubject
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

  def optimizeDescription
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
