def janken
  puts "じゃんけん..."
  puts "0(グー),1(チョキ),2(パー),3(戦わない)"
  input = gets.chomp

  unless input.match?(/^[0-3]$/)
    puts "入力値が不正です。0〜3の数字を入力してください。"
    return :invalid
  end

  player = input.to_i
  return :quit if player == 3

  computer = rand(3)
  puts "あなたの手: #{hand_name(player)} / 相手の手: #{hand_name(computer)}"

  if player == computer
    puts "あいこで再戦！"
    return :draw
  end

  if (player == 0 && computer == 1) ||
     (player == 1 && computer == 2) ||
     (player == 2 && computer == 0)
    puts "じゃんけんに勝ちました！"
    return :win
  else
    puts "じゃんけんに負けました。"
    return :lose
  end
end

def play_attimuitehoi(winner)
  if winner == :player
    puts "あっち向いてホイ！指を差す方向を選んでください"
    puts "0(上), 1(下), 2(左), 3(右)"
    finger_input = gets.chomp
    unless finger_input.match?(/^[0-3]$/)
      puts "不正な値です。0〜3を入力してください。"
      return false
    end
    finger = finger_input.to_i
    face = rand(4)
    puts "あなたの指：#{direction_name(finger)}"
    puts "相手の顔：#{direction_name(face)}"

    if finger == face
      puts "あなたの勝ちでゲーム終了！"
      return true
    else
      puts "勝負つかず！再戦します。"
      return false
    end
  else
    puts "あっち向いてホイ！顔の向きを選んでください"
    puts "0(上), 1(下), 2(左), 3(右)"
    face_input = gets.chomp
    unless face_input.match?(/^[0-3]$/)
      puts "不正な値です。0〜3を入力してください。"
      return false
    end
    face = face_input.to_i
    finger = rand(4)
    puts "相手の指：#{direction_name(finger)}"
    puts "あなたの顔：#{direction_name(face)}"

    if finger == face
      puts "あなたの負けでゲーム終了。"
      return true
    else
      puts "勝負つかず！再戦します。"
      return false
    end
  end
end

puts "1 → じゃんけんを始める / 2 → 終了する"
choice = gets.to_i

if choice != 1 && choice != 2
  return puts "入力値が不正です。「1」か「2」を入力してください。"
end

if choice == 2
  puts "また遊んでね！"
  return
end

loop do
  result = play_janken
  case result
  when :quit
    puts "戦いませんでした。終了します。"
    break
  when :invalid, :draw
    next
  when :win
    break if play_attimuitehoi(:player)
  when :lose
    break if play_attimuitehoi(:computer)
  end
end