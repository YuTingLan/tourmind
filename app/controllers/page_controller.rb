# frozen_string_literal: true

class PageController < ApplicationController

  before_action :authenticate_user!, only: [:pricing]
  skip_before_action :verify_authenticity_token, only: [:return, :notify]

  def home; end
  
  def pricing
  end

  def notify
    rsp = Newebpay::MpgResponse.new(params[:TradeInfo])
  end

  def return
    rsp = Newebpay::MpgResponse.new(params[:TradeInfo])

    if rsp.success?
      redirect_to root_path
    end

  end

end
