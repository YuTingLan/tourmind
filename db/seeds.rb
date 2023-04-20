# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

sites = {
  day1: [
    { name: "台北市立美術館", stay_time: 20, type: "景點" },
    { name: "華山1914文化創意產業園區", stay_time: 65, type: "景點" },
    { name: "饒河街觀光夜市", stay_time: 100, type: "餐廳" },
  ],
  day2: [
    { name: "國立故宮博物院", stay_time: 10, type: "景點" },
    { name: "北投溫泉區", stay_time: 38, type: "景點" },
    { name: "台北101觀景台", stay_time: 73, type: "景點" },
  ],
}

sites2 = {
  day1: [
    { name: "國立故宮博物院", stay_time: 20, type: "景點" },
    { name: "士林夜市", stay_time: 60, type: "餐廳" },
    { name: "臺北101", stay_time: 30, type: "夜景" },
  ],
  day2: [
    { name: "陽明山國家公園", stay_time: 20, type: "景點" },
    { name: "北投區溫泉博物館", stay_time: 25, type: "溫泉" },
    { name: "士林官邸", stay_time: 35, type: "景點" },
  ],
  day3: [
    { name: "象山", stay_time: 15, type: "戶外" },
    { name: "中正紀念堂", stay_time: 40, type: "景點" },
  ],
}

Plan.create(
  name: "臺北城市文化探險之旅",
  description:
    "這個兩天的行程將帶你遊覽臺北市的文化、美食、自然和現代化等多個方面。第一天，您將參觀台灣藝術家的作品，探索熱鬧的藝文場所，品嚐當地美食。第二天，您將欣賞中國古代文物和藝術品，放鬆身心，欣賞城市全景。這個行程適合喜歡城市探險和文化體驗的旅行者。",
  days: 2,
  locations: sites,
  category: "文化",
)

Plan.create(
  name: "臺北城市自然和現代化之旅",
  description:
    "這個三天的行程將帶你遊覽臺北市的文化、美食、自然和現代化等多個方面。第一天，您將欣賞中國古代藝術品、探索著名的夜市、欣賞現代化建築的壯觀。第二天，您將欣賞壯麗的自然風光、探索台灣溫泉的歷史和文化。",
  days: 3,
  locations: sites2,
  category: "自然",
)
