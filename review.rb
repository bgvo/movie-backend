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