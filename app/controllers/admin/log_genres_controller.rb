class Admin::LogGenresController < ApplicationController

  #伝達ログ・ジャンル一覧
  def index
    @log_genre = LogGenre.new
    @log_genres = LogGenre.all
  end

  def create
    @log_genre = LogGenre.new(log_genre_params)
    if @log_genre.save
      redirect_to admin_log_genres_path
    end
  end

  def edit
    @log_genre = LogGenre.find(params[:id])
  end

  def update
   @log_genre = LogGenre.find(params[:id])
   if @log_genre.update(log_genre_params)
     redirect_to admin_log_genres_path
   end
  end

  private
  def log_genre_params
    params.require(:log_genre).permit(:name)
  end

end
