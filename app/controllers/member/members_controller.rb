class Member::MembersController < ApplicationController

  def index
    if params[:is_deleted]
			member = Member.where(is_deleted: true)
			@members = member.order(:id).page(params[:page])
		else
			@members = Member.order(:id).page(params[:page])
		end
  end

  # マイページへのアクション
	def show
	  @member = Member.find(params[:id])
	end

  #プロフィール更新
  def edit
    @member = current_member
  end

  def update
    @member = current_member
    if @member.update(member_params)
      redirect_to member_path(@member)
    end
  end

  # 退職アクション
  def withdraw
    @member = current_customer
    @member.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

  private
  def member_params
    params.require(:member).permit(:last_name, :first_name, :last_name_eng, :first_name_eng, :employee_number, :profile_image, :is_deleted, :affiliation)
  end
end
