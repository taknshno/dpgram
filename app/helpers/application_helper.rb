module ApplicationHelper
  def correct_user?
    @user = User.find(params[:id])
    flash[:danger] = "アクセスする権限がありません。"
    redirect_to root_url unless @user == current_user
  end
end
