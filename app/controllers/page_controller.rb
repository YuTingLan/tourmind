# frozen_string_literal: true

class PageController < ApplicationController

  before_action :authenticate_user!, only: [:pricing]

  def home; end
  
  def pricing

  end
end
