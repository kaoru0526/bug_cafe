# frozen_string_literal: true

DRINKS = [
  { name: 'コーヒー', price: 300 },
  { name: 'カフェラテ', price: 400 },
  { name: 'チャイ', price: 460 },
  { name: 'エスプレッソ', price: 340 },
  { name: '緑茶', price: 450 }
].freeze

FOODS = [
  { name: 'チーズケーキ', price: 470 },
  { name: 'アップルパイ', price: 520 },
  { name: 'ホットサンド', price: 410 }
].freeze

def ask_for_order_number(menus)
  loop do
    print 'メニュー番号を入力してください > '
    order_number = gets.to_i - 1
    if order_number.between?(0, menus.size - 1)
      return order_number
    else
      puts "無効な入力です。1〜#{menus.size}の範囲で選んでください。"
    end
  end
end

def take_order(menus)
  menus.each.with_index(1) do |menu, i|
    puts "(#{i})#{menu[:name]}: #{menu[:price]}円"
  end

  order_number = ask_for_order_number(menus)
  puts "#{menus[order_number][:name]}(#{menus[order_number][:price]}円)ですね。"
  order_number
end

puts 'bugカフェへようこそ！ご注文は？ 番号でどうぞ'
drink = take_order(DRINKS)

puts 'フードメニューはいかがですか?'
food = take_order(FOODS)

total = DRINKS[drink][:price] + FOODS[food][:price]
puts "お会計は#{total}円になります。ありがとうございました！"
