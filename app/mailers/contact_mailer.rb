class ContactMailer < ApplicationMailer
  def contact_mail(contact)
    @contact = contact
    mail to: @contact.email, subject: "【 Menta Cycle 】お問い合わせを受付いたしました。"
  end
end
