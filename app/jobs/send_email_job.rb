class SendEmailJob < ActiveJob::Base
  queue_as :default

  def perform(atendee)
    @atendee = atendee
    RegistrationMailer.sample_email(@atendee).deliver_later
  end
end
