require 'spec_helper'
describe SubCategoriesController do
	
   include Devise::TestHelpers
	before :each do
    @user = User.create!(:email => 'abc@gmail.com', :password => 'password', :password_confirmation => 'password')
  sign_in @user  
end


describe "#new category" do
    it "takes four parameter and returns a SubCategory object" do
        get "new"
        @sub_categories=SubCategory.create(:name=>'Douglas')
        @sub_categories.should be_an_instance_of SubCategory
         response.should render_template('new')
    end
end
describe "#list_events_for_category" do
	 it "takes caegory id and returns a event object" do
        @sub_categories=SubCategory.create(:name=>'Douglas')
         @events=Event.create!(:name=>'event1',:agenda=>'eevnt1',:description=>'event1',:sub_category_id=>1,:attachment_file=>'abc.txt',:event_date=>'2013-01-15')
      @events=Event.create!(:name=>'event2',:agenda=>'eevnt2',:description=>'event2',:sub_category_id=>1,:attachment_file=>'abc.txt',:event_date=>'2013-01-15')
        get "list_events_for_category" ,:id=>@sub_categories.id
	 	
        @events.should be_an_instance_of Event
    end
end
describe "#destroy category" do
	it "takes categoy Id and returns nothing" do
         @sub_categories=SubCategory.create(:name=>'category8')
        get "destroy" ,:id=>@sub_categories.id
         response.should render_template(:action => 'index')
        end
    end
end     

