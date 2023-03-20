class Admin::LogsController < ApplicationController
  def index
    @search = Log.ransack(params[:id])
    @items = @search.result.page(params[:page]).per(10)
  end

  def new
    @logs = Log.new
  end

  def show
    @logs = Log.find(params[:id])
  end


  private
  def log_params
    params.require(:log).permit(:member_id, :log_genre_id, :title, :body, :importance)
  end
end
