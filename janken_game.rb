class JankenAttimuiteHoi
  HANDS       = %w[グー チョキ パー].freeze
  DIRECTIONS  = %w[上 下 左 右].freeze

  def initialize
    start_menu
  end

  private

 
  def hand_name(idx)      = HANDS[idx]
  def direction_name(idx) = DIRECTIONS[idx]


  def janken
    puts "\nじゃんけん..."
    puts "0(グー) 1(チョキ) 2(パー) 3(戦わない)"
    input = gets.chomp

    unless input.match?(/^[0-3]$/)
      puts "入力値が不正です。0〜3を入力してください。"
      return :invalid
    end

    player = input.to_i
    return :quit if player == 3

    computer = rand(3)
    puts "あなた: #{hand_name(player)} / 相手: #{hand_name(computer)}"

    return :draw if player == computer

    if (player == 0 && computer == 1) ||
       (player == 1 && computer == 2) ||
       (player == 2 && computer == 0)
      puts "じゃんけん勝利！"
      :win
    else
      puts "じゃんけん敗北…"
      :lose
    end
  end

  def play_attimuitehoi(turn) 
    if turn == :player
      puts "\nあっち向いてホイ！指を差す方向を選んでください"
      puts "0(上) 1(下) 2(左) 3(右)"
      finger = read_direction or return false
      face   = rand(4)
      puts "あなたの指：#{direction_name(finger)}"
      puts "相手の顔：#{direction_name(face)}"

      if finger == face
        puts "あなたの勝ちでゲーム終了！"
        true
      else
        puts "勝負つかず！再戦します。"
        false
      end
    else
      puts "\nあっち向いてホイ！顔の向きを選んでください"
      puts "0(上) 1(下) 2(左) 3(右)"
      face   = read_direction or return false
      finger = rand(4)
      puts "相手の指：#{direction_name(finger)}"
      puts "あなたの顔：#{direction_name(face)}"

      if finger == face
        puts "あなたの負けでゲーム終了…"
        true
      else
        puts "勝負つかず！再戦します。"
        false
      end
    end
  end


  def game_loop
    loop do
      case janken
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
  end

  def start_menu
    puts "1 → じゃんけんを始める / 2 → 終了する"
    choice = gets.chomp

    unless %w[1 2].include?(choice)
      puts "入力値が不正です。「1」か「2」を入力してください。"
      return
    end
    return puts "また遊んでね！" if choice == "2"

    game_loop
  end

  def read_direction
    input = gets.chomp
    if input.match?(/^[0-3]$/)
      input.to_i
    else
      puts "不正な値です。0〜3を入力してください。"
      nil
    end
  end
end

JankenAttimuiteHoi.new