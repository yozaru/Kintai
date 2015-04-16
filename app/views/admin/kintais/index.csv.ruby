csv_str = CSV.generate do |csv|
  csv << @admin_kintais.column_names
    @admin_kintais.all.each do |kintai|
    csv << kintai.attributes.values_at(*@admin_kintaiss.column_names)
  end
end

NKF::nkf('--sjis -Lw', csv_str)
