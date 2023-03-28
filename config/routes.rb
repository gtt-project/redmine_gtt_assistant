# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html

# Define assistant routes
scope :assistant do
  # Route for generating a subject based on the issue description
  post '/generate/subject', to: 'gtt_assistant#generate_subject', as: :assistant_generate_subject

  # Route for optimizing the issue description with Markdown formatting
  post '/optimize/description', to: 'gtt_assistant#optimize_description', as: :assistant_optimize_description
end
