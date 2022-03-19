Rails.application.routes.draw do
  get 'result/result_page'
  #get 'home/top'
  root 'home#top'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
