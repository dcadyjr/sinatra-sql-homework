require 'bundler'
Bundler.require
require "./models/RecordsModel"


get '/albums' do
	 
	 albums = Record.all
	 albums.to_json	
end

get '/albums/:id' do
	id = params[:id]
	res = conn.exec("SELECT id, band, title, release_date, no_of_songs, cover FROM albums WHERE id = #{id};")
	ascot = res[0]
	ascot.to_json
end

post '/albums' do

	new_album = JSON.parse(request.body.read)

	p new_album

	band = new_album["band"]
	title = new_album["title"]
	release_date = new_album["release_date"]
	no_of_songs = new_album["no_of_songs"]
	cover = new_album["cover"]

	conn.exec("INSERT INTO albums (band, title, release_date, no_of_songs, cover)
			  VALUES ('#{band}', '#{title}', '#{release_date}', '#{no_of_songs}', '#{cover}'); ")

	"success"
end

patch '/albums/:id' do
	id = params[:id]
	updated_album = JSON.parse(request.body.read)

	band = updated_album["band"]
	title = updated_album["title"]
	release_date = updated_album["release_date"]
	no_of_songs = updated_album["no_of_songs"]
	cover = updated_album["cover"]

	conn.exec("UPDATE albums SET band = '#{band}', title = '#{title}', release_date = '#{release_date}', no_of_songs = '#{no_of_songs}', cover = '#{cover}' WHERE id = #{id};")

	"success"

end

delete '/albums/:id' do

	id = params[:id]

	conn.exec("DELETE FROM albums WHERE id = #{id};")
	"success"
end

























