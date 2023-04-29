class UsersController < ApplicationController
  skip_before_action :login_required, only: %i[new create]
  before_action :set_user, only: %i[show edit update]
  before_action :current_user_checked, only: %i[show edit update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user.id)
      flash[:success] = "アカウントを作成しました"
    else
      flash[:danger] = "入力に誤りがあります"
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = "プロフィールを編集しました"
      redirect_to user_path
    else
      flash[:danger] = "プロフィールの編集に失敗しました"
      render :edit
    end
  end

  private

  def set_user
    @user= User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :image, :image_cache)
  end
end
