	describe Movie do
		describe 'attributes' do
			let(:movie) do #Creamos método para no tener que estar creando cada dos por tres un nuevo 'movie'. Puede haber métodos que se llamen igual en diferentes 'describes'. Tendrá valor el más "anidado".
				Movie.new('Die Hard', 'Action', "02-02-2000")
			end
			it 'has a title' do
				expect(movie.title).to eq('Die Hard')
			end
			it 'has a genre' do
				expect(movie.genre).to eq('Action')
			end
			describe 'ordering' do
				it 'orders itself by its title' do
					aladin = Movie.new('Aladin', 'animation', '02-03-1998')
					top_gun = Movie.new('Top Gun', 'animation', '02-03-1995')

					ordered_movies = [top_gun, aladin].sort

					expect(ordered_movies.first).to eq(aladin)
					expect(ordered_movies.last).to eq(top_gun)

				end
			end
		end
	end

