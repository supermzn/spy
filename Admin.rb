require 'bcrypt'
require 'mysql'

class User
	attr_reader :name, :password_hash, :tags
	def initialize(name, password_hash, tags)
		@name = name
		@password_hash = password_hash
		@tags = tags
	end
end


def add_user
	puts 'Proszę wpisać imię, hasło oraz opis.'
	print 'Imię: '
	name = gets.chomp
	print 'Hasło: '
	password = gets.chomp
	print 'Dodaj tagi [opcjonalne]: '
	tags = gets.chomp
	hash = BCrypt::Password.create password
	save(User.new(name, hash, tags))
end


def save_user(user)
	con = Mysql.new 'localhost', 'spy', 'db%SPY16'
	con.query("CREATE DATABASE IF NOT EXISTS Spy")
	con.query("USE Spy")
	con.query("CREATE TABLE IF NOT EXISTS Users(id INT PRIMARY KEY AUTO_INCREMENT, name VARCHAR(30), password_hash VARCHAR(100), description VARCHAR(30))")
	con.query("INSERT INTO Users(name, password_hash, description) VALUES(\'#{user.name}\', \'#{user.password_hash}\', \'#{user.tags}\')")
	puts "Dodano pomyślnie użytkownika #{user.name}"
	con.close
end

def edit_user
	print_users
	print 'Podaj ID użytkownika: '
	id = gets.chomp.to_i
	con = Mysql.new 'localhost', 'spy', 'db%SPY16'
	con.query("USE Spy")
	rs = con.query("SELECT * FROM Users WHERE id=\'#{id}\';")
	us = rs.fetch_hash
	if us.nil?
		puts 'Nie ma takiego użytkownika!'
		con.close
		return
	end
	puts 'Podaj nowe dane (jeśli nie chcesz zmienić wciśnij ENTER)'
	print 'Imię: '
	name = gets.chomp
	if !name.empty?
		con.query("UPDATE Users SET name=\'#{name}\' WHERE id=\'#{id}\';")
		puts 'Zmieniono imię'
	end
	print 'Hasło: '
	password = gets.chomp
	if !password.empty?
		puts 'Aby zmienić hasło trzeba podać poprzednie!'
		print 'Poprzednie hasło: '
		pass = gets.chomp
		true_password = BCrypt::Password.new(us["password_hash"])
		if true_password == pass
			hash = BCrypt::Password.create(password)
			con.query("UPDATE Users SET password_hash=\'#{hash}\' WHERE id=\'#{id}\';")
			puts 'Zmieniono hasło'
		else puts "Hasło niepoprawne. Nie zmieniono."
		end
	end
	print 'Dodaj tagi [opcjonalne]: '
	tags = gets.chomp
	if !tags.empty?
		con.query("UPDATE Users SET description=\'#{tags}\' WHERE id=\'#{id}\';")
		puts 'Zmieniono tagi'
	end
	con.close
end

def delete_user
	print_users
	print 'Podaj ID użytkownika: '
	id = gets.chomp.to_i
	con = Mysql.new 'localhost', 'spy', 'db%SPY16'
	con.query("USE Spy")
	rs = con.query("SELECT * FROM Users WHERE id=\'#{id}\';")
	us = rs.fetch_hash
	if us.nil?
		puts 'Nie ma takiego użytkownika!'
		con.close
		return
	end
	con.query("DELETE FROM Users WHERE id=\'#{id}\';")
	puts 'Usunięto pomyślnie'
	con.close	
end

def add_process
	con = Mysql.new 'localhost', 'spy', 'db%SPY16'
	con.query("USE Spy")
	con.query("CREATE TABLE IF NOT EXISTS Processes(id INT PRIMARY KEY AUTO_INCREMENT, command VARCHAR(30))")
	# con.query("ALTER TABLE Processes ADD description text;")
	print 'Podaj nazwę procesu: '
	comm = gets.chomp
	print 'Dodaj tagi [opcjonalne]: '
	tags = gets.chomp
	con.query("INSERT INTO Processes(command, description) VALUES(\'#{comm}\', \'#{tags}\')")
	puts 'Dodano proces pomyślnie'
	con.close
end

def edit_process
	print_processes
	print 'Podaj ID procesu: '
	id = gets.chomp.to_i
	con = Mysql.new 'localhost', 'spy', 'db%SPY16'
	con.query("USE Spy")
	rs = con.query("SELECT * FROM Processes WHERE id=\'#{id}\';")
	pr = rs.fetch_hash
	if pr.nil?
		puts 'Nie ma takiego procesu!'
		con.close
		return
	end
	print 'Podaj nową nazwę procesu: '
	comm = gets.chomp
	if !comm.empty?
		con.query("UPDATE Processes SET command=\'#{comm}\' WHERE id=\'#{id}\';")
		puts 'Zmieniono nazwę'
	end
	print 'Podaj tagi: '
	tags = gets.chomp
	if !tags.empty?
		con.query("UPDATE Processes SET description=\'#{tags}\' WHERE id=\'#{id}\';")
		puts 'Zmieniono tagi'
	end
	con.close
end

def delete_process
	print_processes
	print 'Podaj ID procesu: '
	id = gets.chomp.to_i
	con = Mysql.new 'localhost', 'spy', 'db%SPY16'
	con.query("USE Spy")
	rs = con.query("SELECT * FROM Processes WHERE id=\'#{id}\';")
	us = rs.fetch_hash
	if us.nil?
		puts 'Nie ma takiego procesu!'
		con.close
		return
	end
	con.query("DELETE FROM Processes WHERE id=\'#{id}\';")
	puts 'Usunięto pomyślnie'
	con.close	
end

 # preference is boolean
 # if true write to Preferred_processes, else write to Banned_processes
def add_preferred_process(preference)
	con = Mysql.new 'localhost', 'spy', 'db%SPY16'
	con.query("USE Spy")
	puts 'Oto dostępne procesy oraz użytkownicy. Podaj ich ID oraz preferowany czas.'
	print_processes
	print_users
	print "ID użytkownika: "
	user_id = gets.chomp
	print "ID procesu: "
	proc_id = gets.chomp
	print "Adekwatny czas[HH:MM]: "
	pref_time = gets.chomp
	if pref_time.empty?
		pref_time = "00:00"
	elsif (/([01]?[0-9]|2[0-3]):[0-5][0-9]/ =~ pref_time) != 0
		puts 'Niepoprawnie podany czas!'
		return
	end
	con.query("CREATE TABLE IF NOT EXISTS `#{preference}_processes` ( \
		`process_id` int NOT NULL, \
		`user_id` int NOT NULL, \
		`time` TIME NOT NULL DEFAULT '00:00' \
	);")
	rs = con.query("SELECT * FROM #{preference}_processes WHERE process_id=#{proc_id} AND user_id=#{user_id};")
	if rs.fetch_hash.nil?
		con.query("INSERT INTO #{preference}_processes VALUES(\'#{proc_id}\', \'#{user_id}\', \'#{pref_time}\');")
		puts "Dodano pomyślnie"
	else
		puts "Taka para użytkownik-proces już istnieje!"
	end	
	con.close
end

def edit_prefered_process(preference)
	puts 'Oto dostępne procesy oraz użytkownicy. Podaj ich ID.'
	print_processes_users(preference)
	print "ID użytkownika: "
	user_id = gets.chomp.to_i
	print "ID procesu: "
	proc_id = gets.chomp.to_i
	con = Mysql.new 'localhost', 'spy', 'db%SPY16'
	con.query("USE Spy")
	rs = con.query("SELECT * FROM #{preference}_processes WHERE \
		user_id=#{user_id} AND process_id=#{proc_id};")
	pr = rs.fetch_hash
	if pr.nil?
		puts 'Nie ma takiego ustawienia!'
		con.close
		return
	end
	puts 'Teraz wprowadź zmiany odpowiednich wartości [ENTER jeśli bez zmian]'
	print "ID użytkownika: "
	user_id_new = gets.chomp
	if user_id_new.empty?
		user_id_new = pr["user_id"]
	end
	print "ID procesu: "
	proc_id_new = gets.chomp
	if proc_id_new.empty?
		proc_id_new = pr["process_id"]	
	end
	print "Adekwatny czas[HH:MM]: "
	pref_time_new = gets.chomp
	if pref_time_new.empty?
		pref_time_new = pr["time"]
	elsif (/([01]?[0-9]|2[0-3]):[0-5][0-9]/ =~ pref_time_new) != 0
		puts 'Niepoprawnie podany czas! Nie zmieniono.'
		pref_time_new = pr["time"]
	end
	if user_id == user_id_new.to_i and proc_id == proc_id_new.to_i
		con.query("UPDATE #{preference}_processes SET time=\'#{pref_time_new}\' WHERE \
			process_id=\'#{proc_id_new}\' AND	user_id=\'#{user_id_new}\';")
		puts 'Zmiana wprowadzona pomyślnie'
	else
		rs = con.query("SELECT * FROM #{preference}_processes WHERE process_id=#{proc_id} AND user_id=#{user_id};")
		if rs.fetch_hash.nil?
			con.query("UPDATE #{preference}_processes SET process_id=\'#{proc_id_new}\', \
				user_id=\'#{user_id_new}\', time=\'#{pref_time_new}\' WHERE process_id=\'#{proc_id}\' AND user_id=\'#{user_id}\';")
			puts 'Zmiana wprowadzona pomyślnie'
		else
			puts "Taka para użytkownik-proces już istnieje!"
		end		
	end
	# rs = con.query("SELECT * FROM #{preference}_processes WHERE process_id=#{proc_id} AND user_id=#{user_id};")
	# if rs.fetch_hash.nil?
	# 	con.query("UPDATE #{preference}_processes SET process_id=\'#{proc_id_new}\', \
	# 		user_id=\'#{user_id_new}\', time=\'#{pref_time_new}\' WHERE process_id=\'#{proc_id}\' AND user_id=\'#{user_id}\';")
	# else
	# 	puts "Taka para użytkownik-proces już istnieje!"
	# end
	con.close
end

def delete_prefered_process(preference)
	puts 'Oto dostępne ustawienia procesów z użytkownikami. Podaj ich ID.'
	print_processes_users(preference)
	print "ID użytkownika: "
	user_id = gets.chomp
	print "ID procesu: "
	proc_id = gets.chomp
	con = Mysql.new 'localhost', 'spy', 'db%SPY16'
	con.query("USE Spy")
	rs = con.query("SELECT * FROM #{preference}_processes WHERE process_id=\'#{user_id}\' AND process_id=\'#{proc_id}\';")
	pr = rs.fetch_hash
	if pr.nil?
		puts 'Nie ma takiego ustawienia!'
		con.close
		return
	end	
end

def print_processes
	con = Mysql.new 'localhost', 'spy', 'db%SPY16'
	con.query("USE Spy")
	puts 'Oto dostępne procesy:'
	puts "==============================="
	rs = con.query("SELECT * FROM Processes;")
	printf "%s\t%-20s %s\n", 'ID', 'command', 'tags'
	while row = rs.fetch_hash
		printf "%s\t%-20s %s\n", row["id"], row["command"], row["description"]
	end
	con.close
	puts "==============================="
end

def print_users
	con = Mysql.new 'localhost', 'spy', 'db%SPY16'
	con.query("USE Spy")
	puts 'Oto dostępni użytkownicy:'
	puts "==============================="
	rs = con.query("SELECT * FROM Users;")
	printf "%s\t%-20s %s\n", 'ID', 'name', 'tags'
	while row = rs.fetch_hash
		printf "%s\t%-15s %s\n", row["id"], row["name"], row["description"]
	end
	con.close
	puts "==============================="
end

def print_processes_users(preference)
	con = Mysql.new 'localhost', 'spy', 'db%SPY16'
	con.query("USE Spy")
	puts 'Oto dostępne ustawienia:'
	puts "==============================="	
	rs = con.query("SELECT * FROM #{preference}_processes;")
	printf "%s\t\t%s\t\t%s\n", 'ProcID', 'UserId', 'TIME'
	while row = rs.fetch_hash
		printf "%s\t\t%s\t\t%s\n", row["process_id"], row["user_id"], row["time"]
	end
	con.close
	puts "==============================="
end


def menu_helper(pref)
		puts '1 - dodaj proces [domyślne]'
		puts '2 - edytuj proces'
		puts '3 - usuń proces'
		input = gets.chomp.to_i
		case input
		when 0, 1
			add_prefered_process(pref)
		when 2
			edit_prefered_process(pref)
		when 3
			delete_prefered_process(pref)			
		end		
end

def menu
	puts 'Wyberz co chcesz zrobić: '
	puts '1 - Zarządzaj użytkownikami'
	puts '2 - Zarządzaj zdefiniowanymi procesami'
	puts '3 - Zarządzaj preferowanymi procesami'
	puts '4 - Zarządzaj zakazanymi procesami'

	input = gets.chomp.to_i
	case input
	when 1
		puts '1 - dodaj użytkownika [domyślne]'
		puts '2 - edytuj użytkownika'
		puts '3 - usuń użytkownika'
		input = gets.chomp.to_i
		case input
		when 0, 1
			add_user
		when 2
			edit_user
		when 3
			delete_user			
		end
		
	when 2
		puts '1 - dodaj proces [domyślne]'
		puts '2 - edytuj proces'
		puts '3 - usuń proces'
		input = gets.chomp.to_i
		case input
		when 0, 1
			add_process
		when 2
			edit_process
		when 3
			delete_process			
		end
			
	when 3
		pref = "Preferred"
		menu_helper(pref)

	when 4
		pref = "Banned"
		menu_helper(pref)
	else
		puts "zły wybór"				
	end
end

menu
