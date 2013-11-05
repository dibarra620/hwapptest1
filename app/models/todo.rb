class Todo < ActiveRecord::Base
  belongs_to :Tasklist
  attr_accessible :completed, :description, :priority, :title, :Tasklist_id
end
