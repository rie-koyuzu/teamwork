class Member::BookmarksController < ApplicationController
  before_action :authenticate_member!

  def index
    @bookmarks = Bookmark.where(member_id: current_member.id)
  end

  def create
    @log = Log.find(params[:log_id])
    bookmark = @log.bookmarks.new(member_id: current_member.id)
    if bookmark.save
      redirect_to member_logs_path
    else
      redirect_to member_logs_path
    end
  end

  def destroy
    @log = Log.find(params[:log_id])
    bookmark = @log.bookmarks.find_by(member_id: current_member.id)
    if bookmark.present?
        bookmark.destroy
        redirect_to member_logs_path
    else
        redirect_to member_logs_path
    end
  end

end
