Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "count_word#index"
  post "word_count" => "count_word#method_count"
end
