require 'mysql'
require 'sqlite3'
require 'bcrypt'

class Proces
	attr_reader :command, :elapsed_time, :memory, :cpu
	def initialize(comm, time, memory, cpu)
		@command = comm
		@elapsed_time = time
		@memory = memory
		@cpu = cpu

		if @elapsed_time.split(':').length == 2
			@elapsed_time = "00:" + @elapsed_time
		end
	end

		# present process in column format
	def show
		printf "%-20s %s\t%s\t%s\n", @command, @elapsed_time, @memory, @cpu
	end

end

def get_procs_list
	procs = %x"ps -eo comm,etime,rss,%cpu".lines
# procs.delete_at(i) 	#deletes item from list

	list = Array.new
	for i in 1..procs.length-1
		if !procs[i].include? 'kworker' 	# exclude some rubbish
			memory = procs[i].split[2].to_f
			memory = memory/1024	# convert from KBs to MBs
												# Proces.new(command, time, memory, cpu)
			proc = Proces.new(procs[i].split[0], procs[i].split[1], memory.round(1), procs[i].split[3])
			list.push(proc)
		end
	end
	return list
end


def unique_procs(list)
	unique_list = Array.new
	unique_list.push(list[0])
	for i in 1..list.length-1
		proc_uniqe = true
		for j in 0..unique_list.length-1
			if list[i].command == unique_list[j].command
				proc_uniqe = false
			end
		end
		if proc_uniqe
			unique_list.push(list[i])
		end
	end
	return unique_list
end

# generate list of interesting processes, and add them to log
def declared_procs(list)
	con = Mysql.new 'localhost', 'spy', 'db%SPY16'
	con.query("USE Spy")
	rs = con.query("SELECT command FROM Processes")
	declared_list = Array.new
	n_rows = rs.each do |proc|
		for i in 0..list.length-1 do
			if list[i].command == proc[0]
				declared_list.push(list[i])
			end
		end
	end
	con.close
	return declared_list
end

	# moniotring of processes
def monitor(user_id)
	if !user_id
	 	puts "Nie zalogowano poprawnie!"
	 	return
	end
	con = Mysql.new 'localhost', 'spy', 'db%SPY16'
	con.query("USE Spy")
	con.query("CREATE TABLE IF NOT EXISTS `Processes_log` ( \ 
		`user_id` int NOT NULL, \ 
		`process_id` int NOT NULL, \ 
		`started_at` TIMESTAMP NOT NULL, \ 
		`elapsed_time` TIME NOT NULL, \ 
		`memory` FLOAT NOT NULL, \ 
		`cpu` FLOAT NOT NULL, \ 
		FOREIGN KEY (user_id) REFERENCES Users(id), \ 
		FOREIGN KEY (process_id) REFERENCES Processes(id) \ 
	);")
	process_thread = Thread.new {
		while true
			# first make list of unique processes, then present only interesting ones
			# unique_procs(list).each do |p|
			system "clear"
			puts "User #{user_id}"
			printf "%-20s %s\t%s\t%s\n", "COMMAND", "TIME", "MEM", "%CPU"
			declared_procs(unique_procs(get_procs_list)).each do |p|
				p.show
				proc_id = get_proc_id(p)
				rs = con.query("SELECT elapsed_time FROM Processes_log WHERE \
				user_id=#{user_id} AND process_id=\'#{proc_id}\' AND DATE(started_at)=DATE(NOW());")#.fetch_row[0]
				etime = rs.fetch_row
				if etime.nil?
					start_time = con.query("SELECT SUBTIME(NOW(), \'#{p.elapsed_time}\');")
					con.query("INSERT INTO Processes_log(user_id, process_id, started_at, elapsed_time, memory, cpu) \
						VALUES (#{user_id}, #{proc_id}, \'#{start_time.fetch_row[0]}\', \'#{p.elapsed_time}\', \'#{p.memory}\', \'#{p.cpu}\');")
				else
					t = etime[0]
					while tmp = rs.fetch_row
						etime = tmp
					end
					rs = con.query("SELECT HOUR(\'#{etime[0]}\'), MINUTE(\'#{etime[0]}\'), SECOND(\'#{etime[0]}\');")
					t = rs.fetch_row
					t_now = Time.now()
					last_time = Time.new(t_now.year, t_now.month, t_now.day, t[0], t[1], t[2])
					p_time = p.elapsed_time.split(':')
					new_time = Time.new(t_now.year, t_now.month, t_now.day, p_time[0], p_time[1], p_time[2])
					time_difference = (last_time <=> new_time) 
					# puts "last_time=#{last_time}, new_time=#{new_time}, time_difference=#{time_difference}"
					if time_difference >= 0
						start_time = con.query("SELECT SUBTIME(NOW(), \'#{p.elapsed_time}\');")
						con.query("INSERT INTO Processes_log(user_id, process_id, started_at, elapsed_time, memory, cpu) \
							VALUES (#{user_id}, #{proc_id}, \'#{start_time.fetch_row[0]}\', \'#{p.elapsed_time}\', \'#{p.memory}\', \'#{p.cpu}\');")
					else
						start_time = con.query("SELECT SUBTIME(NOW(), \'#{p.elapsed_time}\');").fetch_row
						n = start_time[0].size
						con.query("UPDATE Processes_log SET elapsed_time=\'#{p.elapsed_time}\', \
							started_at=\'#{start_time[0]}\', memory=\'#{p.memory}\', cpu=\'#{p.cpu}\' \
							WHERE user_id=\'#{user_id}\' AND process_id=\'#{proc_id}\' AND \
							started_at LIKE \'#{start_time[0][0..n-3]}%\';")
					end

				end						
			end
			sleep(10)
		end
	}

	webpage_thread = Thread.new {
		session_start_time = Time.new.to_i
		sqlite = SQLite3::Database.open '/home/mazena/.mozilla/firefox/3xgiaqf9.default/places.sqlite'
		con.query("CREATE TABLE IF NOT EXISTS `Websites_log` ( \ 
			`user_id` int NOT NULL, \ 
			`domain_id` int NOT NULL, \ 
			`url` TEXT NOT NULL, \ 
			`time` TIMESTAMP NOT NULL, \ 
			FOREIGN KEY (`user_id`) REFERENCES `Users`(`id`), \ 
			FOREIGN KEY (`domain_id`) REFERENCES `Domains`(`id`)
			);")
		while true
			db = sqlite.execute("SELECT datetime(a.visit_date/1000000,'unixepoch', 'localtime') AS visit_date, b.url \ 
				FROM moz_historyvisits AS a JOIN \ 
				moz_places AS b ON a.place_id=b.id WHERE a.visit_date/1000000 > #{session_start_time} ORDER BY a.visit_date DESC;")
			db.each do |row|
				rs = con.query("SELECT * FROM Domains;")
				while domain = rs.fetch_row					
					if row[1].include? domain[1]
						con.query("INSERT INTO Websites_log(user_id, domain_id, url, time) \
						 VALUES(\'#{user_id}\', \'#{domain[0]}\', \'#{row[1]}\', \'#{row[0]}\');")
					end
				end
				# rs = con.query("SELECT * FROM Domains WHERE \'#{row[1]}\' LIKE \'%\'\'#{domain}\'\'%\');")
			end
		 # db.execute("UPDATE moz_historyvisits SET user_id=#{user_id} WHERE visit_date/1000000 > #{session_start_time} AND user_id ISNULL;")
		 # puts session_start_time
		 sleep 30
		end
		db.close
	}
	webpage_thread.join
	process_thread.join
	con.close
end

# log in as a defined user, returns current user ID
def login
	puts 'Podaj ID użytkownika, oraz hasło.'
	print 'ID: '
	id = gets.chomp
	print 'Hasło: '
	password = gets.chomp
	con = Mysql.new 'localhost', 'spy', 'db%SPY16'
	con.query("USE Spy")
	rs = con.query("SELECT password_hash FROM Users WHERE id=#{id};")
	true_password = BCrypt::Password.new(rs.fetch_row[0])
	con.close
	if true_password == password
		puts "Zalogowano jako #{id}"
		return id
	else puts "Zły login lub hasło!"
	end
end

# seek id of process in table Processes
def get_proc_id(proc)
	con = Mysql.new 'localhost', 'spy', 'db%SPY16'
	con.query("USE Spy")
	id = con.query("SELECT id FROM Processes WHERE command=\'#{proc.command}\';")
	return id.fetch_row[0].to_i
end

def get_etime(proc)
	con = Mysql.new 'localhost', 'spy', 'db%SPY16'
	con.query("USE Spy")
	etime = con.query("SELECT elapsed_time FROM Processes_log WHERE command=\'#{proc.command}\';")	
end



monitor(login)

# select Processes_log.user_id, Processes.command, Processes_log.started_at from Processes_log inner join Processes ON Processes.id=Processes_log.process_id;