Rails.application.routes.draw do
  namespace :api, defaults: {format: 'json'} do
    with_options except: [:new, :edit] do |r|
      r.resources :leagues do
        r.resources :teams
      end
      r.resources :events
    end
  end
end
