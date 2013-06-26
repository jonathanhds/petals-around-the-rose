require 'spec_helper'
require 'string'

describe String do

	it "should check is string is an integer number" do
		"123".should be_number
		"12a3".should_not be_number
	end

end