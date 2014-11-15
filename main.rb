require 'gdbm'

class DBWrap

	def init(database)
		#wraps the database with .db
		GDBM.new("#{database}.db")
	end

	def create(database)
		# gdbm = GDBM.new("#{database}.db")
		gdbm = init(database)
		gdbm.close
		puts "The Database '#{database}' has been created."
	end

	def load(database)

		# gdbm = GDBM.new(database)
		gdbm = init(database)
		gdbm.each_pair do |key, value|
			puts "@#{key}: #{value}"
		end
		gdbm.close
	end

	def insert(database, object, value)
		gdbm = init(database)
		gdbm[object] = value.to_s
		gdbm.close
	end
end