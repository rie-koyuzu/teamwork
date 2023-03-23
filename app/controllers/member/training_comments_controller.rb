class Member::TrainingCommentsController < ApplicationController

 # コメントを作成する
  def create
    training = Training.find(params[:training_id])
    comment = current_member.training_comments.new(training_comment_params)
    comment.training_id = training.id
    comment.training_genre_id = training.training_genre_id

    comment.save!
      redirect_to member_trainings_path
  end

  def update
  end

  def destroy
  end

  def training_comment_params
    params.require(:training_comment).permit(:comment, :progress)
  end

end
