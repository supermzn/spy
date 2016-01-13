require 'bcrypt'
require 'mysql'

class User
	attr_reader :name, :password_hash
	def initialize(name, password_hash)
		@name = name
		@password_hash = password_hash
	end
end


def create
	puts 'Please type in your name, and then your password'
	print 'Name: '
	name = gets.chomp
	print 'Password: '
	password = gets.chomp
	hash = BCrypt::Password.create password
	save(User.new(name, hash))
end

def save(user)
	con = Mysql.new 'localhost', 'spy', 'db%SPY16'
	con.query("CREATE DATABASE IF NOT EXISTS Spy")
	con.query("USE Spy")
	con.query("CREATE TABLE IF NOT EXISTS Users(id INT PRIMARY KEY AUTO_INCREMENT, name VARCHAR(30), password_hash VARCHAR(100))")
	con.query("INSERT INTO Users(name, password_hash) VALUES(\'#{user.name}\', \'#{user.password_hash}\')")
	puts "zapisano użytkownika #{user.name} o haśle #{user.password_hash}"
	con.close
end

def add_process
	con = Mysql.new 'localhost', 'spy', 'db%SPY16'
	con.query("USE Spy")
	con.query("CREATE TABLE IF NOT EXISTS Processes(id INT PRIMARY KEY AUTO_INCREMENT, command VARCHAR(30))")
	print 'Podaj nazwę procesu: '
	comm = gets.chomp
	con.query("INSERT INTO Processes(command) VALUES(\'#{comm}\')")
	con.close
end

def menu
	puts 'Wyberz co chcesz zrobić: '
	puts '1 - dodaj użytkownika'
	puts '2 - dodaj proces'

	input = gets.chomp.to_i
	case input
	when 1
		puts "wybrano 1"# create 
	when 2
		add_process		
	else
		puts "zły wybór"				
	end
end

menu
