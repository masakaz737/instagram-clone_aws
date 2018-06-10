class PostMailer < ApplicationMailer
  def post_mail(post, user)
    @post = post
    @user = user

    mail to: @user.email, subject: "投稿完了メール"
  end
end
