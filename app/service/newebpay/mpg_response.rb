# frozen_string_literal: true

module Newebpay
  class MpgResponse
    # 使用 attr_reader 可以更方便取用這些資訊
    attr_reader :status, :message, :result, :order_no, :trans_no, :amount, :pay_time

    def initialize(params)
      @key = Rails.application.credentials[:newebpay_key]
      @iv = Rails.application.credentials[:newebpay_iv]
      response = decrypy(params)
      @status = response['Status'] # 回傳狀態
      @message = response['Message']

      @result = response['Result']
      @order_no = @result['MerchantOrderNo'] # 商店訂單編號
      @trans_no = @result['TradeNo'] # 藍新交易序號
      @amount = @result['Amt'] # 付款金額
      @pay_time = @result['PayTime'] # 付款時間
    end

    def success?
      status === 'SUCCESS'
    end

    def mpg_result
      result
    end

    private

    # AES 解密
    def decrypy(encrypted_data)
      encrypted_data = [encrypted_data].pack('H*')
      decipher = OpenSSL::Cipher.new('aes-256-cbc')
      decipher.decrypt
      decipher.padding = 0
      decipher.key = @key
      decipher.iv = @iv
      data = decipher.update(encrypted_data) + decipher.final
      raw_data = strippadding(data)
      JSON.parse(raw_data)
    end

    def strippadding(data)
      slast = data[-1].ord
      slastc = slast.chr
      string_match = /#{slastc}{#{slast}}/ =~ data
      if string_match.nil?
        false
      else
        data[0, string_match]
      end
    end
  end
end
