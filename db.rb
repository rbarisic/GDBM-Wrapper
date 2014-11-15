require 'main.rb'

Wrapper = DBWrap.new

@usage_create = "Creating a database:\n'ruby db.rb create database'\n"
@usage = "How to use this program:\nruby db.rb @command\nexamples:\n#{@usage_create}"

@command = ARGV[0]
@database = ARGV[1]
@object = ARGV[2]
@value = ARGV[3]

abort(@usage) if @command == nil

# puts @database
# puts @object
# puts @value

case @command
	when 'create' 
		if @database
			Wrapper.init(@database)
		else @usage_create
		end
	when 'load'

	when 'insert'

	else
		abort(@usage)
end