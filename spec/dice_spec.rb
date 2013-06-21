require 'spec_helper'
require 'dice'

describe Dice do

	context 'should return numbers greater than zero' do
		it { subject.roll.should be > 0 }
	end

	context 'should return numbers smaller than seven' do
		it { subject.roll.should be < 7 }
	end
	
end