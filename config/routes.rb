Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
   root "tasks#home"

   # INDEX : lister toutes les tasks
   get '/tasks', to: 'tasks#index'

   # CREATE : créer et ajouter une nouvelle tâche à la liste
   get '/tasks/new', to: 'tasks#new'
   post '/tasks', to: 'tasks#create'

      # SHOW : afficher les détails de la task
      get '/tasks/:id', to: 'tasks#show', as: :task
end
