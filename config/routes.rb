Rails.application.routes.draw do
  resources :verse_collections
  # static resources/summaries
  get 'bible/home'
  get 'bible/verses'
  get 'bible/verse_summary/:id', to: 'bible#verse_summary'

  # dynamic resources
  resources :study_notes
  resources :study_books
  resources :study_authors
  resources :snippets
  resources :verse_comments

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Defines the root path route ("/")
  root "landing#index"
end
