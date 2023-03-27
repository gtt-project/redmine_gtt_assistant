# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html

scope :assistant do
  post '/generate/subject', to: 'gtt_assistant#generateSubject', as: :assistant_generate_subject
  post '/optimize/description', to: 'gtt_assistant#optimizeDescription', as: :assistant_optimize_description
end
