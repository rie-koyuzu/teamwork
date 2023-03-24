class Member::LikesController < ApplicationController

  def create
  	log = Log.find(params[:log_id])
  	like = current_member.likes.new(log_id: log.id)
  	like.seve
    redirect_to member_logs_path(log)
  end

  def destroy
  	log = Log.find(params[:log_id])
  	like = current_member.likes.find_by(log_id: log.id)
  	log.destroy
  	redirect_to member_logs_path
  end
end
