require 'colorize'
require_relative 'main'


@command = ARGV[0]
@database = ARGV[1]
@object = ARGV[2]
@value = ARGV[3]

# Strings for End-Users
@usage_create = "Creating a database:\n'ruby db.rb create database'\n"
@usage = "How to use this program:\nruby db.rb @command\nexamples:\n#{@usage_create}"


@failure_create = "Couldn't create the Database '#{@database}.rb'! Please check your command.".colorize(:red)
@failure_load = "couldn't load." #change this
@failure_insert = "couldn't insert key/value pair into database '#{@database}".colorize(:red) #change this

Wrapper = DBWrap.new(@database)

abort(@usage) if @command == nil

# puts @database
# puts @object
# puts @value

case @command
	when 'create' 
		if @database
			Wrapper.create(@database)
		else 
			puts @failure_create
			abort(@usage_create)
		end
	when 'load'
		if @database
			Wrapper.load(@database)
		else
			abort(@failure_load)
		end
	when 'insert'
		if @database && @object && @value
			Wrapper.insert(@database, @object, @value)
		else
			abort(@failure_insert)
		end
end