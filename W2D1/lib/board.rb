class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = Array.new(14){[]}
    place_stones
    @player1 = name1
    @player2 = name2
  end

  def place_stones
    (0..5).each do |int|
      4.times{@cups[int] << :stone}
      4.times{@cups[int+7] << :stone}
    end
  end

  def valid_move?(start_pos)
    raise 'Invalid starting cup' unless (1..6).include?(start_pos) ||
      (7..12).include?(start_pos)
  end

  def make_move(start_pos, current_player_name)
    stones = @cups[start_pos].length
    @cups[start_pos] = []
    next_pos = start_pos
    until stones == 0
      next_pos += 1
      next_pos = 0 if current_player_name == @player1 && next_pos == 13
      next_pos = 7 if current_player_name == @player2 && next_pos == 6
      next_pos = 0 if next_pos == 14
      @cups[next_pos] << :stone
      stones -= 1
    end
    render
    next_turn(next_pos, current_player_name)
  end

  def next_turn(idx, name)
    return :switch if @cups[idx].length == 1 && idx != 6 && idx != 13
    return :prompt if idx == 6 && name == @player1
    return :prompt if idx == 13 && name == @player2
    idx
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def cups_empty?
    @cups[0..5].all?{|cup| cup.empty?} ||
      @cups[7..12].all?{|cup| cup.empty?}
  end

  def winner
    return :draw if @cups[6] == @cups[13]
    return @player1 if @cups[6].length > @cups[13].length
    return @player2 if @cups[6].length < @cups[13].length
  end
end
