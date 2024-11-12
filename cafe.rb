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

def take_order(menus)
  menus.each.with_index(1) do |menu, i|
    puts "(#{i})#{menu[:name]}: #{menu[:price]}円"
  end

  order_number = nil
  until order_number && order_number.between?(0, menus.size - 1)
    print 'メニュー番号を入力してください > '
    order_number = gets.to_i - 1
    unless order_number.between?(0, menus.size - 1)
      puts "無効な入力です。1〜#{menus.size}の範囲で選んでください。"
    end
  end

  puts "#{menus[order_number][:name]}(#{menus[order_number][:price]}円)ですね。"
  order_number
end

puts 'bugカフェへようこそ！ご注文は？ 番号でどうぞ'
order1 = take_order(DRINKS)

puts 'フードメニューはいかがですか?'
order2 = take_order(FOODS)

total = DRINKS[order1][:price] + FOODS[order2][:price]
puts "お会計は#{total}円になります。ありがとうございました！"

