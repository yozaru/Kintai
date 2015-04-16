csv_str = CSV.generate do |csv|
  csv << @kintais.column_names
    @kintais.all.each do |user|
    csv << kintai.attributes.values_at(*@kintais.column_names)
  end
end

NKF::nkf('--sjis -Lw', csv_str)
