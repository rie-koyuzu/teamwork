class Admin::TrainingGenresController < ApplicationController

  # トレーニングジャンル管理
  def index
    @training_genre = TrainingGenre.new
    @training_genres = TrainingGenre.all
  end

  def create
    @training_genre = TrainingGenre.new(training_genre_params)
    if @training_genre.save
      redirect_to admin_training_genres_path
    end
  end

  def edit
    @training_genre = TrainingGenre.find(params[:id])
  end

  def update
    @training_genre = TrainingGenre.find(params[:id])
    if @training_genre.update(training_genre_params)
      redirect_to admin_trainings_path
    end
  end

  private
  def training_genre_params
    params.require(:training_genre).permit(:menu)
  end
end
