# frozen_string_literal: true

module PageHelper
  def format_date(date)
    date.in_time_zone('Taipei').strftime('%Y/%m/%d')
  end
end
