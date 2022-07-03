Rails.application.routes.draw do
    # add code
    root "home#index"
    get "home/index" => "home#index"
    get 'payment/index' => 'payment#index'
    
    get 'payment/window' => 'payment#window'
    get 'payment/vaapi' => 'payment#vaapi'
    get 'payment/keyinapi' => 'payment#keyinapi'
    get 'payment/inquiryapi' => 'payment#inquiryapi'
    get 'payment/easypay' => 'payment#easypay'
    get 'payment/direct' => 'payment#direct'
    get 'payment/cancelapi' => 'payment#cancelapi'
    
    get 'payment/success' => 'payment#success'
    get 'payment/fail' => 'payment#fail'
    # end code
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
