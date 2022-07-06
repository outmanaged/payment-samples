class PaymentController < ApplicationController

  def vaapi
    datetime = Time.now.to_i
      
    options = {
      headers: {
        Authorization: "Basic " + Base64.strict_encode64("test_sk_D4yKeq5bgrpKRd0JYbLVGX0lzW6Y:"),
        "Content-Type": "application/json"
      },
      body: {          
        orderId: datetime,
        amount: 50000,
        customerEmail: "customer@email.com",
        customerName: "박토스",
        orderName: "토스 가상계좌 결제",
        bank: "국민",
        validHours: 72,
        virtualAccountCallbackUrl: "https://webhook.site/8f1dca13-02e7-41d6-a6bb-9c217a73d4a8",
        customerMobilePhone: "01000001234",
        useEscrow: false         
      }.to_json
    }
      
    begin
      response = HTTParty.post("https://api.tosspayments.com/v1/virtual-accounts", options).parsed_response
      @Response = response
    end      
  end
  
end
