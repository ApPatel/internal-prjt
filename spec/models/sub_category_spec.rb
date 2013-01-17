require 'factory_girl_rails'
require 'spec_helper.rb'

describe SubCategory do
 
    describe "#validationcheck" do
        it "check for name present during craetion" do

  SubCategory.new(:name => "").should_not be_valid
end

    end


describe "#name validation" do
it "name validation" do
  SubCategory.new(:name => "").should_not be_valid
end
end


  let(:subCategory) { subCategory.new(:name => "subCategory1") }

describe "#name to be blank" do
   it "name validation to be blank" do
    SubCategory.name = nil
    SubCategory.valid?
    SubCategory.errors[:name].should include("can't be blank")
  end
end
end