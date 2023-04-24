# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Restaurant.create!([{
  name: '甘霖涼麵-永和店',
  intro: '我們是涼麵店，也有賣熱拌麵
  今天我想推薦給您 #純粹乾拌麵
  就是在這樣的天氣才會這樣的想起這碗麵
  使用純醬拌麵，沒有五光十色的過度調味
  淡黃色Q彈的麵條，完整吸附醬汁
  加上些許燙青菜
  入口後青菜的清脆與麵條的口感千絲萬縷
  輕鬆補充每日必須養分與熱量
  給您一碗單純的好味道
  滿足味覺...',
  image: 'https://lh3.googleusercontent.com/p/AF1QipNUlESGRGoTRr1TSegH69b-HTb68JG0ZVfAguHs=w768-h432-p-no-v0',
  address: '新北市永和區,得和路373巷,3號',
  section: '永和區',
  tel: '0908032183',
  website: 'https://timely-noodle.business.site/',
  price: 120,
  restaurant_type: 2,
}])
