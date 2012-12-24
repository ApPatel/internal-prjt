class Event < ActiveRecord::Base
  attr_accessible :agenda, :attachment_file, :description, :name, :sub_category_id, :event_date
  belongs_to :sub_category 

end
