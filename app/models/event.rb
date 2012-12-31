class Event < ActiveRecord::Base
  attr_accessible :agenda, :attachment_file, :description, :name, :sub_category_id, :event_date
   validates :agenda, :presence => true
   validates :description, :presence => true
   validates :name, :presence => true
   validates :event_date, :presence => true
   validates :sub_category_id, :presence=>true
  belongs_to :sub_category 

end
