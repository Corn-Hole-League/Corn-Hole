Rails.application.routes.draw do
  namespace :api do
    resources :leagues, except: [:new, :edit] do
      resources :teams, except: [:new, :edit]
    end
    resources :events, except: [:new, :edit]
  end
end
