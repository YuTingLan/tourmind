# frozen_string_literal: true

class Restaurant < ApplicationRecord
  # 喜愛清單關聯
  has_many :favorites, as: :favorable, dependent: :destroy

  # 欄位認證
  validates :name, :address, presence: true

  CUISINE_OPTIONS = ['中式料理', '日式料理', '亞洲料理', '健康料理', '印度料理', '台灣小吃/台菜', '壽司', '墨西哥料理', '法式料理', '美式料理', '燒肉', '韓式料理',
                     '越南料理', '海鮮料理']
  ATMOSTPHERE = %w[浪漫 溫馨 大自然 舒適休閒 安靜 熱鬧 歷史悠久 高貴 藝術氛圍]

  enum restaurant_type: { '餐廳': 0, '酒吧及夜店': 1, '小吃': 2, '麵包糕點': 3, '咖啡和茶': 4, '甜點': 5, '特色食品市場': 6 }

  class << self
    def cuisine_list
      CUISINE_OPTIONS.map { |k| [k, k] }
    end

    def atmostphere_list
      ATMOSTPHERE.map { |k| [k, k] }
    end

    def restaurant_type_list
      restaurant_types.map { |k, _v| [k, k] }
    end
  end
end
