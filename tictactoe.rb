class Player
	@name
	@symbol
	def initialize(name,symbol)
		#puts "Enter the name of #{id}st player :"
		@name = name
		#puts "Enter the symbol of #{id}st player :"
		@symbol = symbol
	end
	def getName
		@name
	end
	def getSymbol
		@symbol
	end
end
class Board
	@board
	@size
	def initialize (size)
		@board =[]
		@size = size
		j= 0
		while(j<size)do
			val =[]	
			i =0 
			while(i<@size)do
				val.push(0)
				i=i+1
			end
			@board.push(val)
			j=j+1
		end
	end
	def isSafe(x,y)
		if(@board[x][y]!=0)
			return false
		end
		return true
	end
	def set(x, y, symbol)
		@board[x][y] = symbol
	end
	def ifwin symbol
		i = 0
		while(i<@size)do
			check = true
			j=0
			while(j<@size)do
				if(@board[i][j]!=symbol)
					check = false
				end
				j=j+1
			end
			if(check)
				return true
			end
			i=i+1
		end
		i = 0;
		while(i<@size)do
			check = true
			j=0
			while(j<@size)do
				if(@board[j][i]!=symbol)
					check = false
				end
				j=j+1
			end
			if(check)
				return true
			end
			i=i+1
		end
		i=0
		check =true
		j=0
		while(i<@size)do
			if(@board[i][j]!=symbol)
				check=false
			end
			i=i+1
			j=j+1
		end
		if(check)
			return true
		end
		i=0
		check =true
		j=@size-1
		while(i<@size)do
			if(@board[i][j]!=symbol)
				check=false
			end
			i=i+1
			j=j-1
		end
		if(check)
			return true
		end
		return false
	end
	def showboard
		i = 0
		while (i<@size) do
			print @board[i]
			puts
			i=i+1
		end
	end
end
class Game
	@board
	@player1
	@player2
	@curplayer
	@count 
	def initialize(n)
		@board = Board.new(n)
		@player1 = Player.new("anand","X")
		@player2 = Player.new("bhavishya","O")
		@curplayer = 1
		@count =0
	end
	def changeplayer
		if @curplayer==1
			@curplayer=2
		else
			@curplayer=1
		end

	end
	def doeswin
			return @board.ifwin(@player1.getSymbol) || @board.ifwin(@player2.getSymbol)
	end
	def doesFirstWin
		return @board.ifwin(@player1.getSymbol)
	end
	def getFirstPlayer
		return @player1.getName
	end
	def getSecondPlayer
		return @player2.getName
	end
	def currentPlayer
		if @curplayer==1
			return @player1.getName
		end
		return @player2.getName
	end
	def isSafeMove(x, y)
		@board.isSafe(x,y)
	end
	def setMove(x, y)
		if(@curplayer==1)
			@board.set(x,y,@player1.getSymbol)
		else
			@board.set(x,y,@player2.getSymbol)
		end
		@count = @count + 1
	end
	def getCount
		@count
	end
	def show
		@board.showboard
	end
end
class GameManager
	puts "Welcome"
	puts "please specify the size of the board"
	#size = gets.to_i
	game = Game.new(3)
	while(!game.doeswin && game.getCount<9)do
		valid = false
		puts "it is #{game.currentPlayer} chance :"
		while(!valid)do
			puts "enter X"
			x = gets.to_i
			puts "enter y"
			y = gets.to_i
			if game.isSafeMove(x, y)
				valid = true
				game.setMove(x,y)
			else
				puts "invalid please enter again"
			end
		end
		puts "been here"
		game.changeplayer
		system("clear")
		game.show
	end
	if game.doeswin
		if game.doesFirstWin
			puts "***********************************#{game.getFirstPlayer} Wins *************************************************"
		else
			puts "***********************************#{game.getSecondPlayer} Wins *************************************************"
		end
	else
		puts "Draw"
	end
end


