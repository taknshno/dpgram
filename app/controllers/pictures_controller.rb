class PicturesController < ApplicationController
  before_action :set_picture, only: %i[show edit update destroy]
  before_action :current_user_checked, only: %i[edit update]

  def index
    @pictures = Picture.all
  end

  def new
    if params[:back]
      @picture = Picture.new(picture_params)
    else
      @picture = Picture.new
    end
  end

  def create
    @picture = current_user.pictures.build(picture_params)
    if params[:back]
      render :new
    else
      if @picture.save
        PostingMailer.posting_mail(@picture).deliver
        flash[:success] = "画像を投稿しました"
        redirect_to pictures_path
      else
        flash[:danger] = "入力に誤りがあります"
        render :new
      end
    end
  end

  def show
    @favorite = current_user.favorites.find_by(picture_id: @picture.id)
  end

  def edit
  end

  def update
    if @picture.update(picture_params)
      flash[:success] = "記事を編集しました"
      redirect_to pictures_path
    else
      render :edit
    end
  end

  def destroy
    @picture.destroy
    flash[:success] = "記事を削除しました"
    redirect_to pictures_path
  end

  def confirm
    @picture = current_user.pictures.build(picture_params)
    if @picture.invalid?
      flash[:danger] = "入力に誤りがあります"
      render :new
    end
  end

  private

  def set_picture
    @picture = Picture.find(params[:id])
  end

  def picture_params
    params.require(:picture).permit(:image, :image_cache, :content)
  end
end
