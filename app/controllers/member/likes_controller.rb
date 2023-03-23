class Member::LikesController < ApplicationController

  def create
  	log = Log.find(params[:log_id])
    Like.create(member_id: current_member.id, log_id: params[:id])
    redirect_to member_logs_path
  end

  def destroy
  	log = Log.find(params[:log_id])
  	like = current_member.likes.find_by(log_id: log.id)
  	log.destroy
  	redirect_to member_logs_path
  end

  private
  def like_params
    params.require(:like).permit(:member_id, :log_id)
  end

end
