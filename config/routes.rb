Rails.application.routes.draw do
  get 'youtube/index'
  root 'home#top'
  get 'home/about'
  get 'choose/choose_page'
  get 'result/result_page'
  post 'result/result_page' => 'result/result_page'
end
