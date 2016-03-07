require 'csv'

puts 'Parsing FIle'

data = CSV.foreach('./School_Progress_Report_2010-2011.csv', headers: true).map do |row|
  {
    name: row['SCHOOL'],
    admin: row['PRINCIPAL'],
    intervention: row['PROGRESS REPORT TYPE'],
    level: row['SCHOOL LEVEL'],
    peer: row['PEER INDEX'],
    grade: row['2010-2011 OVERALL GRADE'],
    gradeNum: row['2010-2011 OVERALL SCORE']
  }
end

puts 'Placing in Database'
Score.create(data);
