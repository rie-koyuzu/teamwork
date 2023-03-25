class Member::LikesController < ApplicationController

  def create
  	log = Log.find(params[:log_id])
  	like = current_member.likes.new(log_id: log.id)
  	like.save
    redirect_to member_log_path(log)
  end

  def destroy
  	log = Log.find(params[:log_id])
  	like = current_member.likes.find_by(log_id: log.id)
  	like.destroy
  	redirect_to member_log_path(log)
  end
end
