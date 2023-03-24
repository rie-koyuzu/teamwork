class Admin::LogsController < ApplicationController
  def index
    @member = current_member
    @log = Log.new
    @logs = Log.all
  end

  def new
    @logs = Log.new
  end

  def show
    @logs = Log.find(params[:id])
  end

  def destroy
    @logs = Log.find(params[:id])
    @log.destroy
    redirect_to admin_logs_path
  end

  private
  def log_params
    params.require(:log).permit(:member_id, :log_genre_id, :title, :body, :importance)
  end
end
