class Admin::TrainingsController < ApplicationController

  def index
    @trainings = Training.all
    @training_genres = TrainingGenre.all
  end

  def new
    @trainings = Training.new
  end

  def show
    @training = Training.find(params[:id])
    @training_genres = TrainingGenre
  end

  def edit
    @training = Training.find(params[:id])
  end

  def update
    @training = Training.find(params[:id])
    if @training.update(training_params)
      redirect_to admin_trainings_path(@training)
    end
  end

  def create
    @trainings = Training.new(training_params)
    if @trainings.save
      redirect_to admin_trainings_path(@training)
    end
  end

  def destroy
    trainings = Training.find(params[:id])
    trainings.destroy
    redirect_to admin_trainings_path
  end

  private
  def training_params
    params.require(:training).permit(:member_id, :training_genre_id, :feedback, :progress, :title, :time, :introductio)
  end
end
