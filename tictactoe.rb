class TicTacToe
  def initialize
    @board = Array.new(3) { Array.new(3, ' ') }
    get_players
    @current_player = @players.first
  end

  def get_players
    puts "Enter first player's name"
    player1 = gets.chomp
    puts "Player #{player1} plays with X"
    puts "Enter second player's name"
    player2 = gets.chomp
    puts "Player #{player2} plays with O"
    @players = [
      { player: 1, name: player1, plays_with: 'X' },
      { player: 2, name: player2, plays_with: 'O' }
    ]
  end

  def print_board
    puts "  1 2 3"
    @board.each_with_index do |row, index|
      print "#{index + 1} "
      row.each { |cell| print "#{cell}|" }
      puts "\n  -+-+-" unless index == 2
    end
  end

  def play
    until game_over?
      print_board
      puts ''
      puts "\nPlayer #{@current_player[:name]}, enter your move (row column): "
      row, col = gets.chomp.split.map(&:to_i)

      if valid_move?(row, col)
        @board[row - 1][col - 1] = @current_player[:plays_with]
        switch_player
      else
        puts "Invalid move! Please try again."
      end
    end

    print_board
    puts game_result
  end

  private

  def valid_move?(row, col)
    row.between?(1, 3) && col.between?(1, 3) && @board[row - 1][col - 1] == ' '
  end

  def switch_player
    @current_player = @current_player[:player] == 1 ? @players.last : @players.first
  end

  def game_over?
    winner? || @board.all? { |row| row.none? { |cell| cell == ' ' } }
  end

  def winner?
    winning_combinations = [
      [[0, 0], [0, 1], [0, 2]], # Rows
      [[1, 0], [1, 1], [1, 2]],
      [[2, 0], [2, 1], [2, 2]],
      [[0, 0], [1, 0], [2, 0]], # Columns
      [[0, 1], [1, 1], [2, 1]],
      [[0, 2], [1, 2], [2, 2]],
      [[0, 0], [1, 1], [2, 2]], # Diagonals
      [[0, 2], [1, 1], [2, 0]]
    ]

    winning_combinations.any? do |combo|
      combo.all? { |row, col| @board[row][col] == @current_player[:plays_with] }
    end
  end

  def game_result
    return "It's a draw!" unless winner?

    "Player #{@current_player[:name]} wins!"
  end
end

# Main program
game = TicTacToe.new
game.play
