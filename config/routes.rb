Rails.application.routes.draw do
  root 'home#top'
  get 'home/about'
  get 'choose/choose_page'
  get 'result/result_page'
  post 'result/result_page' => 'result/result_page'
end
