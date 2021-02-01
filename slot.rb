#初期設定
coin_amount = 100
win_point = 0
end_flag = 0
normal_judge = 0
special_judge = 0

##main##
while coin_amount > 0
    
  puts "---------------------"
  puts "残りコイン数#{coin_amount}"
  puts "ポイント#{win_point}"
  puts "何コイン入れますか？"
  puts "1(10コイン) 2(30コイン) 3(50コイン) 4(やめとく)"
  puts "---------------------"

  select_cost = gets.to_i

  case select_cost
  when 1
    if coin_amount >= 10    
      coin_amount -= 10
      gain_value = 10
    else
      puts "コインが足りません"
      next
    end
  when 2
    if coin_amount >= 30
      coin_amount -= 30
      gain_value = 50
    else
      puts "コインが足りません"
      next
    end
  when 3
    if coin_amount >= 50
      coin_amount -= 50
      gain_value = 50
    else
      puts "コインが足りません"
      next
    end
  when 4
    end_flag = 1
    break
  else
    end_flag = 2
    break
  end

#スロット処理
  puts "エンターを3回押してください！"
  puts "---------------------"
  push_enter = gets
  
  arr_left = [1, 2, 3, 4, 5, 6, 7]
  ret_left = arr_left.sample(3)
  
  number_left_upper = ret_left[0]
  number_left_mid = ret_left[1]
  number_left_lower = ret_left[2]
  puts "|#{number_left_upper}| | |"
  puts "|#{number_left_mid}| | |"
  puts "|#{number_left_lower}| | |"
  puts "---------------------"
  
  push_enter = gets
  
  arr_center = [1, 2, 3, 4, 5, 6, 7]
  ret_center = arr_center.sample(3)
  
  number_center_upper = ret_center[0]
  number_center_mid = ret_center[1]
  number_center_lower = ret_center[2]
  puts "|#{number_left_upper}|#{number_center_upper}| |"
  puts "|#{number_left_mid}|#{number_center_mid}| |"
  puts "|#{number_left_lower}|#{number_center_lower}| |"
  puts "---------------------"
  
  push_enter = gets
  
  arr_right = [1, 2, 3, 4, 5, 6, 7]
  ret_right = arr_right.sample(3)
  
  number_right_upper = ret_right[0]
  number_right_mid = ret_right[1]
  number_right_lower = ret_right[2]
  puts "|#{number_left_upper}|#{number_center_upper}|#{number_right_upper}|"
  puts "|#{number_left_mid}|#{number_center_mid}|#{number_right_mid}|"
  puts "|#{number_left_lower}|#{number_center_lower}|#{number_right_lower}|"
  puts "---------------------"

#スロット判定
  normal_judge = 0
  if number_left_upper == number_center_upper && number_left_upper == number_right_upper
    normal_judge += 1
  end
  if number_left_mid == number_center_mid && number_left_mid == number_right_mid
    normal_judge += 1
  end
  if number_left_lower == number_center_lower && number_left_lower == number_right_lower
    normal_judge += 1
  end
  if number_left_upper == number_center_mid && number_left_upper == number_right_lower
    normal_judge += 1
  end
  if number_left_lower == number_center_mid && number_left_lower == number_right_upper
    normal_judge += 1
  end
  
  if number_left_upper == 7 && number_center_upper == 7 && number_right_upper == 7
    special_judge += 1
  end
  if number_left_mid == 7 && number_center_mid == 7 && number_right_mid == 7
    special_judge += 1
  end
  if number_left_lower == 7 && number_center_lower == 7 && number_right_lower == 7
    special_judge += 1
  end
  if number_left_upper == 7 && number_center_mid == 7 && number_right_lower == 7
    special_judge += 1
  end
  if number_left_lower == 7 && number_center_mid == 7 && number_right_upper == 7
    special_judge += 1
  end

#スコア計算
  normal_score = 0
  if normal_judge > 0
    case normal_judge
    when 1
      normal_score = 1 * gain_value
    when 2
      normal_score = 9 * gain_value
    when 3
      normal_score = 30 * gain_value
    end
    puts "当たり！数字が#{normal_judge}列揃いました"
    puts "#{normal_score}ポイント獲得！"
  end
  
  special_score = 0
  if special_judge > 0
    special_score = 10 * gain_value
    puts "大当たり！ラッキー7が揃いました"
    puts "スペシャルボーナス#{special_score}ポイント獲得！"
  end
  
  total_score = special_score + normal_score
  
  if total_score > 0
    puts "合計#{total_score}ポイント獲得！"
  else 
    puts "残念！ポイント獲得ならず..."
  end

#継続処理
  win_point += total_score
  select_cost = 0
  normal_judge = 0
  special_judge = 0
end

#終了処理
if end_flag == 1
  puts "終了します"
  
elsif end_flag == 2
  puts "エラーが発生しました"
  
else
  puts "残りコイン数#{coin_amount}"
  puts "ポイント#{win_point}"
  puts "コインがなくなりました"
end