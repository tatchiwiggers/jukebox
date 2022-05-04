class ReviewsController < ApplicationController
before_action :set_song

    def new
        @review = Review.new
    end

    def create
        @review = Review.new(review_params)
        @review.song = @song
        if @review.save
            redirect_to review_path(@review)
        else
            render :new
        end
    end

    private

    def set_song
        @song = Song.find(params[:song_id])
    end

    def review_params
        params.require(:review).permit(:content)
    end
end
