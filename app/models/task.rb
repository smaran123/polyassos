class Task < ActiveRecord::Base
belongs_to :worker
 # has_many :worker_comments,:dependent=>:destroy
#accepts_nested_attributes_for :worker_comments, :allow_destroy => true, :reject_if=>:all_blank

end
