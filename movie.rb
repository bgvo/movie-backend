require 'date'

class Movie
  attr_reader :title
  attr_accessor :genre, :review
  attr_accessor :date
  def initialize(title, genre = '', date = '')

    @title = title
    @genre = genre
    @date = Date.parse(date) unless date.empty?
    @review = []

  end

  def <=>(other)
    title <=> other.title
  end

  def add_review(review)
    @review = review
  end
end