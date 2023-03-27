class Admin::TrainingGenresController < ApplicationController
  before_action :authenticate_admin!

  # トレーニングジャンル管理
  def index
    @training_genre = TrainingGenre.new
    @training_genres = TrainingGenre.all
  end

  def create
    @training_genre = TrainingGenre.new(training_genre_params)
    if @training_genre.save
      redirect_to admin_training_genres_path
    else
     flash[:training_genre_created_error] = "ジャンル名を入力してください"
      redirect_to admin_training_genres_path
    end
  end

  def edit
    @training_genre = TrainingGenre.find(params[:id])
  end

  def update
    @training_genre = TrainingGenre.find(params[:id])
    if @training_genre.update(training_genre_params)
      redirect_to admin_training_genres_path
    end
  end

  def destroy
    training_genres = TrainingGenre.find(params[:id])
    training_genres.destroy
    redirect_to admin_training_genres_path
  end

  private
  def training_genre_params
    params.require(:training_genre).permit(:menu, :is_genres_status)
  end
end