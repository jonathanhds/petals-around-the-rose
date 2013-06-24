class String
	def i?
		!!(self =~ /^[-+]?[0-9]+$/)
	end
end