class SessionsController < ApplicationController
  skip_before_action :login_required, only: %i[new create]

  def new
    render layout: false
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "ログインしました"
      redirect_to pictures_path
    else
      flash[:danger] = "ログインできませんでした"
      render :new, layout: false
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:success] = "ログアウトしました"
    redirect_to new_session_path
  end
end
