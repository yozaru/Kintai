class Kintai < ActiveRecord::Base
 scope :search_names_or, lambda { |search_word| where("name like ? or employee_id like ? or job like ? or project like ? or sex like ?  ", "%#{search_word}%", "%#{search_word}%", "%#{search_word}%", "%#{search_word}%", "%#{search_word}%" ) }

belongs_to :user
belongs_to :timestore

end
