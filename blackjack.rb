
def intro
  puts "Welcome to BlackJack. Do you want to start a new game? \nYes or no"
  play = gets.chomp.downcase
  if play == "yes"
    player_draw
  else
    exit
  end
end

deck = [2, 3, 4, 5, 6, 7, 8, 9, 10, a, k, q, j]
a = "Ace"
k = "King"
q = "Queen"
j = "Jack"

def player_draw
  hand = Array.new(2) { rand(1..11) }
  @sum = hand.inject(0){|sum,x| sum + x }
  puts "Your two cards are #{hand} with a sum of #{@sum}. Would you like to `hit or stay?"
  new_card
end

def player_hit
  card = rand(1..11)
  @sum += card
  if @sum <= 21
    puts "Your new card is #{card}. You are at #{@sum}. Would you like to hit or stay?"
    new_card
  else
    puts "Your new card is #{card}. You are at #{@sum}. You busted!"
    player_bust
  end
end

def new_card
  move = gets.chomp.downcase
  if move == "hit"
    player_hit
  elsif move == "stay"
    stay
  else
    puts "Not a valid response. Please choose 'hit' or 'stay'"
    new_card
  end
end

def stay
  dealer
end

def dealer
  hand = Array.new(2) { rand(1..11) }
  @dealer_sum = hand.inject(0){|sum,x| sum + x }
  puts "Dealer gets #{hand}, hand is #{@dealer_sum}."
  dealer_move
end

def dealer_draw
  @dealer_card = rand(1..11)
  @dealer_sum += @dealer_card
end

def dealer_move
  if @dealer_sum <= 16
    dealer_draw
    puts "Dealer draws #{@dealer_card}. Dealer is at #{@dealer_sum}"
    dealer_move
  elsif @dealer_sum <= 21
    winner
  else
    puts "Dealer busts!"
    house_lose
  end

end

def winner
  if @sum == @dealer_sum
    puts "Push."
  elsif @sum > @dealer_sum
    puts "Player wins!"
  else @sum < @dealer_sum
    puts "House wins!"
  end
end

def house_lose
  puts "You win!"
end

def player_bust
  puts "You bust! House win."
end

p intro
