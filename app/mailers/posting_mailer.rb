class PostingMailer < ApplicationMailer
  def posting_mail(posting)
    @posting = posting

    mail to: @posting.email, subject: "お問い合わせの確認メール"
  end
end
