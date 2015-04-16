require 'csv'
require 'kconv'

# coding: utf-8

class Kintai < ActiveRecord::Base
 belongs_to :manufacture

 has_many :timestores

 scope :search_names_or, lambda { |search_word| where("name like ? or employee_id like ? or job like ? or project like ? or sex like ?  ", "%#{search_word}%", "%#{search_word}%", "%#{search_word}%", "%#{search_word}%", "%#{search_word}%" ) }

   def self.to_csv
    headers = %w(id 社員番号 氏名 出社 退社 職種 プロジェクト カード番号 性別 前日退社時間 月労働時間)
    csv_data = CSV.generate(headers: headers, write_headers: true, force_quotes: true) do |csv|
      all.each do |row|
        csv << row.attributes.values_at(*self.column_names)
      end
    end
    csv_data.encode(Encoding::SJIS)
  end


end
