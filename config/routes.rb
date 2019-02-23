Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :spotify do
      namespace :v1 do
        get "search/:keyword", to: "search#index"
        get "playlists/:id", to: "playlists#show"
        get "albums/:id", to: "albums#show"
        get "artists/:id", to: "artists#show"
        get "home", to: "home#index"
      end
    end

    namespace :youtube do
      namespace :v1 do
        get "get_video", to: "youtube#get_video"
      end
    end
  end
end
