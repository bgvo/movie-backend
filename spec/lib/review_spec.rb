require 'spec_helper'

describe Review do
		describe 'has the following attributes' do
			it 'rating' do
				review = Review.new(5)
				expect(review.rating).to eq(5)
			end
			it 'comment' do
				review = Review.new(5,"Una peli de puta madre")
				expect(review.comment).to eq("Una peli de puta madre")
			end
		end

		describe 'has the following methods' do
			it 'edit rating' do
				review = Review.new(5)
				review.edit(6)
				expect(review.rating).to eq(6)
			end
			
		end
	end