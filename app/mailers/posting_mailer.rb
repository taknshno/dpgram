class PostingMailer < ApplicationMailer
  def posting_mail(picture)
    @picture = picture

    mail to: @picture.user.email, subject: "画像の投稿が完了しました"
  end
end
