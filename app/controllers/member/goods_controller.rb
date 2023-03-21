class Member::GoodsController < ApplicationController

	def create
		log = Log.find(params[:log_id])
		good = current_member.good.new(log_id: log.id)
		good.save
		redirect_to member_logs_path
  end

  def destroy
  	log = Log.find(params[:log_id])
  	good = current_member.goods.find_by(log_id: log.id)
  	log.destroy
  	redirect_to member_logs_path
  end

end
