# frozen_string_literal: true

class Member::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
    before_action :member_state, only: [:create]

    def after_sign_in_path_for(resource)
        member_logs_path
    end

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

   #ここは退職済みの会員はログインできないことを定義
  def member_state
    @member = Member.find_by(email: params[:member][:email])
    return if !@member
      if (@member.valid_password?(params[:member][:password]) && (@member.is_deleted == true))
        redirect_to new_member_session_path
      end
  end
end
