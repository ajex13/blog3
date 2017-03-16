class Contact < MailForm::Base
  attribute :name,      :validate => true
  attribute :message,   :validate => true
  attribute :nickname,  :captcha  => true
  attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i




  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    {
      :subject => "My Contact Form",
      :to => "ajex13@gmail.com",
      :from => %("#{name}" <#{email}>)
    }
  end
end
