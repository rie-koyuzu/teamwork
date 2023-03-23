class Member::TrainingsController < ApplicationController

  def index
    @trainings = Training.all
    @training_comment =TrainingComment.new
  end

  def show
    @training = Training.find(params[:id])
    @training_comment =TrainingComment.new
    #if member_signed_in?
      #@training_comment = TrainingComment.where(member_id:[current_member.id])
    #end
  end

  def edit
    @trainings = Training.all
    @training = Training.new
    @training_genres = TrainingGenre.all
  end

  private
  def training_params
    params.require(:training).permit(:member_id, :training_genre_id, :feedback, :progress, :training_comment, :title, :time, :introductio)
  end
end
