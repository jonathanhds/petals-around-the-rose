class String
	def number?
		!!(self =~ /^[-+]?[0-9]+$/)
	end
end