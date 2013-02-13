require 'spec_helper'

describe EventsController do
   include Devise::TestHelpers
	before :each do
    @user = User.create!(:email => 'abc@gmail.com', :password => 'password', :password_confirmation => 'password')
  sign_in @user  
   
    
  end


describe "#new event" do
    it "takes six parameter and returns a Event object" do
    	 get "new"
        @events=Event.new(:name=>'event1',:agenda=>'eevnt1',:description=>'event1',:sub_category_id=>1,:attachment_file=>'abc.txt',:event_date=>'2013-01-15')
        @events.should be_an_instance_of Event
        response.should render_template('new')
    end
end
describe "#show event" do
	it "takes event id and render show page" do 
    
    @events=Event.create!(:name=>'event1',:agenda=>'eevnt1',:description=>'event1',:sub_category_id=>1,:attachment_file=>'abc.txt',:event_date=>'2013-01-15')
		get "show",:id=>@events.id
		response.should render_template(:action => 'show')
    
end
end
describe "#list event" do 
	it "takes nothing and render all events" do
     @events=Event.create!(:name=>'event1',:agenda=>'eevnt1',:description=>'event1',:sub_category_id=>1,:attachment_file=>'abc.txt',:event_date=>'2013-01-15')
      @events=Event.create!(:name=>'event2',:agenda=>'eevnt2',:description=>'event2',:sub_category_id=>1,:attachment_file=>'abc.txt',:event_date=>'2013-01-15')
   get "index"
    response.should render_template(:action => 'index')
   
  end
end
describe "#search event" do
	it "takes string as parameter and returns events name matching that string" do
    search="event1"
    @sub_categories=SubCategory.create(:name=>'category1')
    @events=Event.create!(:name=>'event1',:agenda=>'eevnt1',:description=>'event1',:sub_category_id=>@sub_categories.id,:attachment_file=>'abc.txt',:event_date=>'2013-01-15')
		get "search",:id=>@sub_categories.id
		   
    	@events.name.should match(search)
    
  
end
end
end