require 'csv'

puts 'Parsing File'

data = CSV.foreach('./School_Progress_Report_2010-2011.csv', headers: true).map do |row|
  {
    name: row['SCHOOL'],
    admin: row['PRINCIPAL'],
    level: row['SCHOOL LEVEL'],
    grade: row['2010-2011 OVERALL GRADE']
  }
end

puts 'Placing in Database'
Score.create(data);
