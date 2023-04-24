# frozen_string_literal: true

module Newebpay
  class Mpg
    attr_accessor :info

    def initialize(params)
      @key = Rails.application.credentials[:newebpay_key]
      @iv = Rails.application.credentials[:newebpay_iv]
      @merchant_id = 'MS348692298'
      @info = {} # 使用 attr_accessor 讓 info 方便存取
      set_info(params)
    end

    def form_info
      {
        MerchantID: @merchant_id,
        TradeInfo: trade_info, # AES加密產品資訊
        TradeSha: trade_sha, # SHA加密產品資訊
        Version: '2.0',
      }
    end

    private

    def trade_info
      aes_encode(url_encoded_query_string)
    end

    def trade_sha
      sha256_encode(@key, @iv, trade_info)
    end

    # 商品資訊
    def set_info(params)
      info[:MerchantID] = @merchant_id
      info[:MerchantOrderNo] = "Test#{Time.now.to_i}"
      info[:Amt] = params
      info[:ItemDesc] = 'VIP for one year'
      info[:TimeStamp] = Time.now.to_i
      info[:RespondType] = 'JSON'
      info[:Version] = '2.0'
    end

    def url_encoded_query_string
      URI.encode_www_form(info)
    end

    def aes_encode(string)
      cipher = OpenSSL::Cipher.new('aes-256-cbc')
      cipher.encrypt
      cipher.key = @key
      cipher.iv = @iv
      cipher.padding = 0
      padding_data = add_padding(string)
      encrypted = cipher.update(padding_data) + cipher.final
      encrypted.unpack1('H*')
    end

    def add_padding(data, block_size = 32)
      pad = block_size - (data.length % block_size)
      data + (pad.chr * pad)
    end

    def sha256_encode(key, iv, trade_info)
      encode_string = "HashKey=#{key}&#{trade_info}&HashIV=#{iv}"
      Digest::SHA256.hexdigest(encode_string).upcase
    end
  end
end
