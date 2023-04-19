class ApplicationController < ActionController::Base
    #404:沒有找到紀錄
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
   

    private
    def record_not_found
    render file: Rails.root.join('public', '404.html'),
           layout: false,
           status: 404 and return
    end
end
