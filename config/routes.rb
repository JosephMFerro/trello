Rails.application.routes.draw do
  root "boards#index"

  resources :boards do
    resources :lists do
      resources :tasks
    end
  end

  # post "/boards/2/lists/id/tasks/new", to: "tasks#update"
end
