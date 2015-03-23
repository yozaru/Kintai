my = Mysql.new('54.92.62.142', 'root', 'Malmen1203', 'Shukei_development')  
res = my.query('SELECT * from timestores')
res.each do |row|  
  puts row[0]  
end
