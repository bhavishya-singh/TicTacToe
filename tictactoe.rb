class Player
	@name
	@symbol
	def initialize(id)
		puts "Enter the name of #{id}st player :"
		@name = gets
		puts "Enter the symbol of #{id}st player :"
		@symbol = gets
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
		while(j<5)do
			val =[]	
			i =0 
			while(i<5)do
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
		return true
	end
	def set(x, y, symbol)
		@board[x][y] = symbol
	end
	def ifwin symbol
		i = 0
		while(i<size)do
			check = true
			j=0
			while(j<size)do
				if(@board[i][j]!=symbol)
					check = false
					j=j+1
			end
			if(check)
				return true
			i=i+1
		end
		while(i<size)do
			check = true
			j=0
			while(j<size)do
				if(@board[j][i]!=symbol)
					check = false
				j=j+1
			end
			if(check)
				return true
			i=i+1
		end
		i=0
		check =true
		j=0
		while(i<size)do
			if(@board[i][j]!=symbol)
				check=false
			i=i+1
			j=j+1
		end
		if(check)
			return true
		i=0
		check =true
		j=size-1
		while(i<size)do
			if(@board[i][j]!=symbol)
				check=false
			i=i+1
			j=j-1
		end
		if(check)
			return true
		return false
	end
	def showboard
		i = 0
		while (i<size) do
			print board[i]
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
		@player1 = Player.new("1")
		@player2 = Player.new("2")
		@curplayer = 1
		@count =0
	end
	def changeplayer
		if curplayer==1
			curplayer=2
		else
			curplayer=1

	end
	def doeswin
		if curplayer==1
			return ifwin(@player1.getSymbol)
		return ifwin(@player2.getSymbol)
	end
	def currentPlayer
		if curplayer==1
			return @player1.getName
		return @player2.getName
	end
	def isSafeMove(x, y)
		isSafe(x,y)
	end
	def setMove(x, y)
		if(curplayer==1)
			set(x,y,@player1.getSymbol)
		else
			set(x,y,@player2.getSymbol)
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
	size = gets.to_i
	game = Game.new(size)
	while(!game.doeswin &&game.getCount<9)do
		valid = false
		while(!valid)do
		puts ="enter X"
		x = gets.to_i
		puts = "enter y"
		y = gets.to_i
		if isSafeMove x y
			valid = true
			game.setMove x y
		else
			puts "invalid please enter again"
		
		end
		game.changeplayer
		game.show
	end
	if game.doeswin
		puts "#{} winsssssssssssssssssssssssssssssssss"
	else
		puts "Draw"
end


