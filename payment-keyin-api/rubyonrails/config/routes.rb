Rails.application.routes.draw do
    # add code
    root "home#index"
  
    get 'payment/keyinapi' => 'payment#keyinapi'
    
    # end code
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
