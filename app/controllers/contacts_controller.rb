class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    if user_signed_in?
      @contact = current_user.contacts.build(contact_params)
    else
      @contact = Contact.new(contact_params)
    end
    if @contact.save
      ContactMailer.contact_mail(@contact).deliver
      if user_signed_in?
        redirect_to user_path(current_user.id), notice: 'お問い合わせを受け付けました。'
      else
        redirect_to new_user_session_path, notice: 'お問い合わせを受け付けました。'
      end
    else
      render :new
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :content, :user_id)
  end
end
