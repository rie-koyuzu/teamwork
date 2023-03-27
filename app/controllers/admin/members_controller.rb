class Admin::MembersController < ApplicationController
  before_action :authenticate_admin!

  def index
		if params[:is_deleted]
			member = Member.where(is_deleted: true)
			@members = member.order(:id).page(params[:page])
		else
			@members = Member.order(:id).page(params[:page])
		end
	end

  def show
    @member = Member.find(params[:id])
  end

  def edit
    @member = Member.find(params[:id])
  end

  def update
    @member = Member.find(params[:id])
    if @member.update(member_params)
      redirect_to admin_member_path
    else
      edit_admin_member_path(@member)
    end
  end

  def search
    @members = Member.search(params[:keyword])
    @keyword = params[:keyword]
    render "index"
  end


  private
  def member_params
    params.require(:member).permit(:last_name, :first_name, :last_name_eng, :first_name_eng, :profile_image, :employee_number, :affiliation, :email, :is_deleted)
  end
end
