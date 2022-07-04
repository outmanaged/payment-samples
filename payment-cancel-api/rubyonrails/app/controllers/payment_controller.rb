class PaymentController < ApplicationController

  def cancelapi
    datetime = Time.now.to_i
    paymentKey = "q2Dv9ZPM7zXLkKEypNArWkaKzB9KArlmeaxYG5R4Jo6bnOwB"
      
    #부분 취소에서만 사용
    cancelAmount = 300
      
    #refundReceiveAccount - 가상계좌 거래에 대해 입금후에 취소하는 경우만 필요
    bank = "국민"
    accountNumber = "12345678901234"
    holderName = "홍길동"
    
    #중복 취소를 막기위해 취소 가능금액을 전송
    refundableAmount = 300
   
    options = {
      headers: {
        Authorization: "Basic " + Base64.strict_encode64("test_sk_D4yKeq5bgrpKRd0JYbLVGX0lzW6Y:"),
        "Content-Type": "application/json"
      },
      body: {          
        cancelReason: "고객 변심",
        cancelAmount: cancelAmount,
        #refundReceiveAccount: {
        #    bank: bank,
        #    accountNumber: accountNumber,
        #    holderName: holderName
        #    }
        #refundableAmount: refundableAmount
      }.to_json
    }
      
	  begin
      response = HTTParty.post("https://api.tosspayments.com/v1/payments/" + paymentKey + "/cancel", options).parsed_response
      @Response = response
    end      
  end
  
end