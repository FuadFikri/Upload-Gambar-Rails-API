Rails.application.routes.draw do
  
	namespace :v1 do 
		post "user/create", to: "users#create"
		get "users", to: "users#index"
		get "user/:id", to: "users#show"
		delete "user/:id/delete", to:"users#delete"
		put "user/update/:id", to: "users#update"

		post 'user/login' => 'user_token#create'
	end
end
