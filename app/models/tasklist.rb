class Tasklist < ActiveRecord::Base
  belongs_to :user

  has_many :todos, :dependent => :destroy
  attr_accessible :title, :user_id
end
