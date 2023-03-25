class Admin::LogsController < ApplicationController
  def index
    @member = current_member
    @log = Log.page(params[:id]).order("created_at DESC")
  end

  def new
    @log =Log.new
    @log_genres = LogGenre.all
    @member = current_member
  end

  def show
    @log = Log.find(params[:id])
    @member = Member.find_by(id: params[:id])
  end

  def destroy
    @logs = Log.find(params[:id])
    @log.destroy
    redirect_to admin_logs_path(log)
  end

  private
  def log_params
    params.require(:log).permit(:member_id, :log_genre_id, :title, :body, :importance)
  end
end
