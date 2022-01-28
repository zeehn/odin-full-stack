require_relative 'player'

class Game 
    def initialize()
        @board = Array.new(3) { Array.new(3) { '0' } }
        @players = []
        @filled_spots = []        
        initialize_board
    end

    def add_player(player)
        @players << player
    end

    def initialize_board 
        count = 0
        @board.each_with_index do |row, i|
            row.each_with_index do |col, j|
                count += 1
                @board[i][j] = count
            end
        end
    end

    def display_board 
        puts
        spaces = "|".rjust(6, " ")
        
        @board.each_with_index do |row, i| 
            row.each do |col|
                #puts spaces + spaces if col == 1
                print col.to_s.center(6, " ") 
                print "|" if find_index(col).last != 2 
            end
            puts
            # print spaces + spaces
             
            puts  "-" * 20 if i != 2
        end
    end

    def find_index(choice) 
        hash = {"0": [1, 2, 3], "1": [4,5,6], "2": [7,8,9]}
        case choice
        when 1..3
            return [0, hash[:"0"].index(choice)]
        when 4..6
            return [1, hash[:"1"].index(choice)]
        else 
            return [2, hash[:"2"].index(choice)]
        end
    end

    def take_input(player)
        print "\n#{player.name} with #{player.sign}, Select a number: "
        choice = gets.chomp.to_i
    end

    def validate_input(choice) 
        if choice.is_a?(Integer) and choice.between?(1, 9)
            if !@filled_spots.include?(choice)
               return true 
            end
            # puts "#{choice} not available. Try again!"
        end
            # puts "Must be an Integer between 1 and 9."
        return false
    end

    def update_board(player, choice)
        index = find_index(choice)
        @board[index.first][index.last] = player.sign
        @filled_spots << choice
        return index
    end
    

    def is_winner?(player, last_input)
        i, j = last_input.first, last_input.last
        return true if vertical_win?(player.sign, j)
        return true if horizontal_win?(player.sign, i)
        return true if diagonal_win?(player.sign, i, j)
    end

    def vertical_win?(sign, j)
        count = 0
        3.times do |index|
            count += 1 if @board[index][j] == sign
        end
        return true if count == 3
    end

    def horizontal_win?(sign, i)
        count = 0
        3.times do |index|
            count += 1 if @board[i][index] == sign
        end
        return true if count == 3
    end

    def diagonal_win?(sign, i, j)
        count = 0
        if i == j and i != 1
            i, j = 0, 0 
            3.times do |index|
                if @board[i][j] == sign
                    count += 1
                    i += 1
                    j += 1
                end
            end
        end
        return true if count == 3

        count = 0
        if (i == 2 and j == 0) or (i == 0 and j == 2)
            i, j = 0, 2
            3.times do
                if @board[i][j] != sign
                    break 
                end
                i += 1
                j -= 1
                count += 1
            end
        end
        return true if count == 3
    end

    def is_board_full?
        @filled_spots.size == 9
    end

    def play
        winner = false
        board_full = false
        loop do  
            @players.each do |player|
                result = false
                until result 
                    choice = take_input(player)
                    result = validate_input(choice)
                end 
                index = update_board(player, choice)
                display_board
                winner = true if is_winner?(player, index)
                board_full = is_board_full?
                if winner 
                    puts "\n#{player.name} WINS!"
                    break
                elsif board_full
                    puts "\nIt's a Draw!"
                    break
                end
            end
            break if winner or board_full
        end
    end
end


