require 'spec_helper'
require 'cinema'
require 'movie'

describe Cinema do
		#Lo último que se ejecuta en el let es lo que se le pasa a la variable indicada dentro del paréntesis del let
		# (en este caso :cinema). Hay que tener en cuenta que cuando se llama a 'cinema' sólo
			let(:cinema){
				aladin = Movie.new('Aladin', 'animation', '02-03-1998')
				top_gun = Movie.new('Top Gun', 'action', '02-03-1995')
				indiana_jones = Movie.new('Indiana Jones', 'action', '02-04-1995')
				Cinema.new([top_gun, aladin, indiana_jones])
			}
			##Las siguientes tres líneas sirven para que antes de cada 'it' se llame al let y se ejecute todo lo que hay dentro.
			#before do
				#cinema
			#end

			##El before se llamará (y se creará un nuevo 'cinema') justo antes de cada 'it'. Eso es porque el 'before' lleva por default un 'each':
			#before(:each) do
				#cinema
			#end

			#Sin embargo, podríamos crear un 'before' que se ejecute justo antes de empezar todos los 'it' y se conserve el estado:
			#before(all) do
				#cinema
			#end

			it 'adds a movie to our listing' do
				cinema = Cinema.new([])
				cinema.add_mew_movie(Movie.new('top_gun', 'animation', '02-03-1995'))
				expect(cinema.get_list_of_movies).to include('top_gun')
			end

			it 'returns the movies ordered by title' do
				ordered_movies = cinema.get_list_by_title		
				expect(ordered_movies).to eq(["Aladin", "Indiana Jones", "Top Gun"])
			end 

			it 'deletes movies from our cinema manager' do
				cinema.remove_movie('Aladin')
				expect(cinema.get_list_of_movies).to_not include('Aladin')				
			end

			it 'lists movies by genre' do
				movies_action = cinema.list_by_genre('action')
				expect(movies_action).to include('Indiana Jones', 'Top Gun')				
			end

			it 'filters movies by date' do
				movies_filtered = cinema.filter_by_date(1994,1996)
				expect(movies_filtered).to eq(['Top Gun', 'Indiana Jones'])				
			end

			it 'movie is in list?' do
				is_in_list = cinema.is_movie_in_list?('Aladin')
				expect(is_in_list).to eq(true)
			end

		describe 'group_by_genre' do
			let(:cinema) {
				aladin = Movie.new('Aladin', 'animation', '02-03-1998')
				top_gun = Movie.new('Top Gun', 'action', '02-03-1995')
				indiana_jones = Movie.new('Indiana Jones', 'action', '02-04-1995')
				cinema = Cinema.new([top_gun, aladin, indiana_jones])
			}
			it 'group the movies of cinema by genre' do

				titles = cinema.group_by_genre

				expect(titles['action']).to include('Top Gun', 'Indiana Jones')
				puts titles['action']
				expect(titles['action'].length).to eq(2)
				expect(titles['animation']).to include('Aladin')
				expect(titles['animation']).to_not include('Top Gun', 'Indiana Jones')
			end
		end
		describe 'sum_by_genre' do
			it 'counts the number of movies in each genre' do
				aladin = Movie.new('Aladin', 'animation', '02-03-1998')
				top_gun = Movie.new('Top Gun', 'action', '02-03-1995')
				indiana_jones = Movie.new('Indiana Jones', 'action', '02-04-1995')
				cinema = Cinema.new([top_gun, aladin, indiana_jones])

				movies_in_genres_hash = cinema.sum_by_genre
				expect(movies_in_genres_hash).to eq({'action' => 2, 'animation' => 1})
			end
		end
	end