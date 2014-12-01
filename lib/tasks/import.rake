require 'csv'

desc "Import students from csv file and problems from project euler"
task :import => [:environment] do

  file = "db/posse_students.csv"

  CSV.foreach(file, :headers => true) do |row|
    User.create({
      :name        => row[0],
      :github_name => row[2],
      :uid         => row[3],
      :provider    => row[4],
      :email       => row[5],
      :posse_id    => row[6],

    })
  end
  
  puts "creating problems..."

  476.times do |index|
    ProblemsWorker.perform_async(index)
  end
end
