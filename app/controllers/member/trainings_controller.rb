class Member::TrainingsController < ApplicationController

  def index
    @trainings = Training.all
    @training_genres = TrainingGenre.all
  end

  def show
    @training = Training.find(params[:id])
    @member = @log.member
  end

  def edit
    @training = Training.find(params[:id])
  end

  private
  def training_params
    params.require(:training).permit(:member_id, :training_genre_id, :feedback, :progress)
  end
end
