class DoubleLast

	def execute(die)
		die[4] * 2
	end

end

class AlwaysFirst

	def execute(die)
		die[0]
	end

end

class PowMiddle

	def execute(die)
		die[2] * die[2]
	end

end

class AnyAnswer

	def execute(die)
		result = Object.new
		def result.==(comparison_object)
			true
		end
		result
	end

end