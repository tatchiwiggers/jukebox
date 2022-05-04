class SongsController < ApplicationController
    def search       #search(query=thriller)
        # @songs = Song.where(title: params[:query])
        @songs = Song.where(title: params[:name])
    end

    def index
        @songs = Song.all
    end

    def show
        @song = Song.find(params[:id])
    end

    def new
        @song = Song.new # para ser passada no form
    end

    def create
        @song = Song.new(song_params)
        if @song.save
            redirect_to song_path(@song)
        else
            render :new
        end
    end
    
    private
    
    def song_params
        params.require(:song).permit(:title, :year, :category)
    end
end
