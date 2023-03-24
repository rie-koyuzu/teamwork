class Member::LogsController < ApplicationController

  def index
    @member = current_member
    @logs = Log.page(params[:id])
  end

  def new
    @log =Log.new
    @log_genres = LogGenre.all
    @member = current_member
  end

  def create
    @log = Log.new(log_params)
    @log.member_id = current_member.id
     if @log.save
       redirect_to member_logs_path(@log)
     end
  end

  def show
    @logs = Log.find(params[:id])
    @member = Member.find_by(id: params[:id])
  end

  def search
    @logs = Log.search(params[:keyword])
    @keyword = params[:keyword]
    render "index"
  end

  def destroy
    log = Log.find(params[:id])
    log.destroy
    redirect_to member_logs_path
  end

private
  def log_params
    params.require(:log).permit(:member_id, :log_genre_id, :title, :body, :importance, :like)
  end
end
