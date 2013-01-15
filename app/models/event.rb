class Event < ActiveRecord::Base
  attr_accessible :agenda, :attachment_file, :description, :name, :sub_category_id, :event_date
   validates :agenda, :presence => true
   validates :description, :presence => true
   validates :name, :presence => true
   validates :event_date, :presence => true
   
   validate :datecheck, :on => :update
  
   validates_format_of :attachment_file, :with => %r{\.(docx|doc|rb|pdf|txt)$}i, :unless=> "attachment_file.nil?"
  belongs_to :sub_category 
def datecheck
	currentDate=Date.today
	 errors.add(:event_date, "event date cant be less than curernt date") if event_date < currentDate

end
end
