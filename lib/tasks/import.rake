require 'csv'

desc "Import students from csv file and problems from project euler"
task :import => [:environment] do

  file = "db/posse_students.csv"

  puts "Creating users..."

  CSV.foreach(file, :headers => true) do |row|
    User.create({
      :name        => row[0],
      :github_name => row[2],
      :uid         => row[3],
      :provider    => row[4],
      :email       => row[5],
      :posse_id    => row[6]
    })
  end

  puts "Creating problems..."

  476.times do |index|
    ProblemsWorker.perform_async(index)
  end

  puts "Creating posses..."

  Posse.create!([
    { name: "Backus", image_url: "http://amturing.acm.org/images/lg_aw/0703524.jpg" },
    { name: "Berners-Lee", image_url: "http://media-cache-ec0.pinimg.com/236x/06/8f/71/068f71435526509121568f91cb5cb017.jpg" },
    { name: "Borg", image_url: "http://upload.wikimedia.org/wikipedia/en/e/e1/Anita_Borg.jpg" },
    { name: "Brooks", image_url: "http://sysrun.haifa.il.ibm.com/ibm/history/exhibits/builders/images/5406FXB.jpg" },
    { name: "Goldberg", image_url: "http://a2.files.biography.com/image/upload/c_fill,dpr_1.0,g_face,h_300,q_80,w_300/MTE5NTU2MzE2MjMyNDUxNTk1.jpg" },
    { name: "Holberton", image_url: "http://thecomputerboys.com/wp-content/uploads/2010/11/computer-girl.png"},
    { name: "Hopper", image_url: "http://media.npr.org/assets/img/2014/10/02/grace-hopper_custom-7e094af0ae451cd447568fd03d9c89ba6bf8b352.jpg" },
    { name: "Ingalls", image_url: "http://www.erlang-factory.com/upload/peopleimage/SFBay2011_DanIngalls/Dan" },
    { name: "Kay", image_url: "http://img.quotery.com/pictures/2013/02/alan-kay.jpg" },
    { name: "Knuth", image_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRprlYkRHq2JlHt603xs0znWiQXpdZ-Iy4k2fLyIfqIVwzq4-FIKw" },
    { name: "Lovelace", image_url: "http://media.npr.org/assets/img/2014/10/02/ada-lovelace_custom-36235be92c6df0badbde6aed459cadf598131dee.jpg" },
    { name: "Matsumoto", image_url: "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcSVNOwXWDUXRLUWflIM5Y0xoCUSYNWfkN7PqyHUMUVCx1aYQ7Pt" },
    { name: "McCarthy", image_url: "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcSrxUkIhWhZdwcyixurHpe6qrEGAGf_tesmmy-6CoK4hRbbiN_9Og" },
    { name: "McNulty", image_url: "http://www.siliconrepublic.com/fs/img/news/201306/rs-400x/antonelli-kay-mcnulty-mauchly-800.jpg" },
    { name: "Ritchie", image_url: "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcT7LQffV9eUIXT9p6jNcA1Pof652eYJZMlFyIs0ZYsEDfbDhBIn" },
    { name: "Sparck-Jones", image_url: "http://esslli2004.loria.fr/content/sparck-jones.jpg" },
    { name: "Van-Rossum", image_url: "http://wiki.linuxformat.ru/wiki/images/thumb/LXF100-101_30_1.jpg/300px-LXF100-101_30_1.jpg" },
    { name: "Von-Neumann", image_url: "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcQ6pFbBg98xzMQ7j_wZ6GXUwWXPGfp--lQr5-rrWNUJy7GNeBWw" }
  ])

end
