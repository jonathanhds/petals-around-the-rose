require_relative 'string'
require_relative 'algorithms'
require_relative 'dice'

class Game

	def start
		@correct_guesses = 0

		algorithm = choose_algorithm

		while @correct_guesses < 6
			round algorithm
		end
	end

	private

	def choose_algorithm
		algorithms = [DoubleLast.new, AlwaysFirst.new, PowMiddle.new, AnyAnswer.new]

		puts "Choose your algorithm:"
		algorithms.each_with_index do |value, index|
			puts "#{index}) #{value.class.name}"
		end

		answer = read_int

		clean_screen

		if answer < 0 || answer > (algorithms.size - 1)
			choose_algorithm
		else
			algorithms[answer]
		end
	end

	def round(algorithm)
		die = roll_die
		puts "The five dice are: #{die}."

		puts "What is the score? "
		guess = read_int

		answer = algorithm.execute die

		if (answer == guess)
			@correct_guesses = @correct_guesses + 1
			puts "Correct."

			if (@correct_guesses == 6)
				puts "Congratulations! You are now a member of the Fraternity of the Petals Around The Rose. You must pledge never to reveal the secret to anyone."
			end
		else
			@correct_guesses = 0
			puts "The correct score is #{answer}.\n"
		end
	end

	def roll_die
		dice = Dice.new
		[ dice.roll, dice.roll, dice.roll, dice.roll, dice.roll ]
	end

	def clean_screen
		print "\e[H\e[2J"
	end

	def read_int
		r = gets.chomp
		r = read_int unless r.number?
		r.to_i
	end

end