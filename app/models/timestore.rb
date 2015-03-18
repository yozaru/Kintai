class Timestore < ActiveRecord::Base
	belongs_to :kintai
	def self.import
	Dir::glob("/home/csv/*.txt").each {|f|
        #puts "#{f}: #{File::stat(f).size} bytes"
        #logger.debug("★#{f}")
        p f
	}	
	end
end
