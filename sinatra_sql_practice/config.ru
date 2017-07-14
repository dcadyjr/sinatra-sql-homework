require './app'

run Sinatra::Application

ActiveRecord::Base.establish_connection(
	:adapter => 'postgresql',
	:database => 'recordcollection'
	)