class ApplicationController < ActionController::Base
  include SessionsHelper

  before_action :login_required

  private

  def login_required
    redirect_to new_session_path unless current_user
  end

  def current_user_checked
    if current_user.id != params[:id].to_i
      flash[:danger]="アクセスができません"
      redirect_to pictures_path
    end
  end
end
