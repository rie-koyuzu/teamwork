class Admin::LogsController < ApplicationController
  def index
    @member = current_member
    @log = Log.page(params[:page]).order("created_at DESC")
  end

  def new
    @log =Log.new
    @log_genres = LogGenre.all
    @member = current_member
  end

  def create
    @log = Log.new(log_params)
    if admin_signed_in?
      @log.member_id = current_admin.id
      @log.member_type = "admin"
    else
      @log.member_id = current_member.id
      @log.member_type = "member"
    end
    if @log.save
      redirect_to admin_logs_path
    end
  end

  def show
    @log = Log.find(params[:id])
    @member = Member.find_by(id: params[:id])
  end

  def destroy
    logs = Log.find(params[:id])
    logs.destroy
    redirect_to admin_logs_path
  end

  private
  def log_params
    params.require(:log).permit(:member_id, :log_genre_id, :title, :body, :importance)
  end
end
