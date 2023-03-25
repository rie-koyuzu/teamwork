class Member::TrainingsController < ApplicationController

  def index
    @trainings = Training.all
    @member = Member.find(params[:member_id])
    #@trainings = @member.trainings
    @training_comment =TrainingComment.new
  end

  def show
    @member = current_member
    @training = Training.find(params[:id])
    @training_comment =TrainingComment.new
    @training_comments = @training.training_comments.where(member_id: @member.id)
    #if member_signed_in?
      #@training_comment = TrainingComment.where(member_id:[current_member.id])
    #end
  end

  def edit
    @member = current_member
    @training = Training.find(params[:id])
  end

  private
  def training_params
    params.require(:training).permit(:member_id, :training_genre_id, :feedback, :progress, :training_comment, :title, :time, :introductio)
  end
end
