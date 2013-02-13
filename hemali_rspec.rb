require_relative 'hemali'	
describe Number, "#add" do
it "should return sum" do 
	
	number=Number.new
	number.add(2,3).should == 4
	
end
	
end