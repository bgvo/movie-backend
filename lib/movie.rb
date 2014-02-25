require 'date'

class Movie
  attr_reader :title
  attr_accessor :genre
  attr_accessor :date
  def initialize(title, genre = '', date = '')

    @title = title
    @genre = genre
    @date = Date.parse(date) unless date.empty?
  end

  def <=>(other)
    title <=> other.title
  end
end

class Cinema
  attr_accessor :movies
  def initialize(movies)
    @movies = movies
  end

  ## LISTING
  def get_list_of_movies
    movies.map {|movie| movie.title}
  end

  def get_list_by_title
    @movies.map {|movie| movie.title}.sort {|a,b| a<=>b}
  end

  def is_movie_in_list?(movie_title)
    movies.each do |movie|
      if movie.title == movie_title
        return true
      end
    end
  end

  def add_mew_movie(movie)
    @movies.push(movie)
  end

  def remove_movie(movie_to_rmv)
    @movies.each do |movie| 
      if movie_to_rmv == movie.title
        @movies.delete(movie)
      end
    end
  end

  def list_by_genre(genre)
    movies_by_genre = @movies.select {|movie| (movie.genre == genre) || (movie.genre == "")}
    movies_by_genre.map {|movie| movie.title}.sort
  end

  def list_by_date
    movies_by_date = @movies.sort {|a,b| a.date_object <=> b.date_object}
    movies_by_date.map {|movie| [movie.title, movie.date_object].join(' - ')}
  end

  def filter_by_date(before, after)
    @movies.select do |movie|
      movie.date.year.between?(before, after)
    end.map {|movie| movie.title} 
  end

  def group_by_genre
    @movies.inject({}) do |hash, movie|
      hash[movie.genre] ||= []
      hash[movie.genre] << movie.title
      hash
    end
  end

  def sum_by_genre
    @movies.reduce({}) do |movies_per_gen, movie|
      movies_per_gen[movie.genre] ||= 0
      movies_per_gen[movie.genre] += 1
      movies_per_gen
    end
  end
end

class Review
  attr_reader :rating, :comment
  def initialize(rating, comment = '')
    @rating = rating
    @comment = comment
  end

  def edit(new_rating)
    @rating = new_rating
  end
end 