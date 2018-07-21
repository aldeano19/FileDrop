Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'static/droper'
  post 'static/droper' => 'static#upload'


  # post 'static/droper' => 'upload'
end
