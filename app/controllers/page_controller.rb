# frozen_string_literal: true

class PageController < ApplicationController
  before_action :authenticate_user!, only: [:pricing]
  skip_before_action :verify_authenticity_token, only: %i[return notify]

  def home; end

  def pricing; end

  def notify
    response = Newebpay::MpgResponse.new(params[:TradeInfo])
  end

  def return
    response = Newebpay::MpgResponse.new(params[:TradeInfo])
    return unless response.success?

    payment = Payment.new
    payment.amount = response.mpg_result['Amt']
    payment.pay_time = response.mpg_result['PayTime']
    payment.status = '付款成功'
    payment.save
    redirect_to pricing_paymentok_path
  end

  def paymentok
    @last_payment = Payment.last
    @diamond_grade = Payment.diamond_grade
    @expire_time = Payment.expire_time
  end
end
