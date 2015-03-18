class Kintai < ActiveRecord::Base

 has_many :timestores

 scope :search_names_or, lambda { |search_word| where("name like ? or employee_id like ? or job like ? or project like ? or sex like ?  ", "%#{search_word}%", "%#{search_word}%", "%#{search_word}%", "%#{search_word}%", "%#{search_word}%" ) }


end
