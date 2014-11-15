require 'gdbm'

class DBWrap

	def initialize(database)
		@db_name = "'#{database}.db'"
		@established = "Database connection established.".colorize(:blue)
		
		@success_create = "The Database #{@db_name} has successfully been created.".colorize(:green)
		@success_load = "Database '#{@db_name}.rb'"
		end

	def init(database)
		#wraps the database with .db
		if database == nil
			abort('failure: no database.').colorize(:red)
		else
			puts @established
			return GDBM.new("#{database}.db")
		end

	end

	def create(database)
		# gdbm = GDBM.new("#{database}.db")
		gdbm = init(database)
		gdbm.close
		puts @success_create
	end

	def load(database)

		# gdbm = GDBM.new(database)
		puts "DB: {@db_name}:"
		gdbm = init(database)
		gdbm.each_pair do |key, value|
			puts "KEY:\t#{key} | VALUE: #{value}"
		end
		gdbm.close
	end

	def insert(database, object, value)
		@success_insert = "Successfully inserted Key: '#{object}' with value '#{object}' into Database '#{@db_name}'".colorize(:green)


		gdbm = init(database)
		gdbm[object] = value.to_s
		gdbm.close
		puts @success_insert
	end
end