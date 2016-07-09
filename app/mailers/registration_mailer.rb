class RegistrationMailer < ApplicationMailer
  default from: "clients@histeria.io"

  def sample_email(atendee)
    @atendee = atendee
    mg_client = Mailgun::Client.new ENV['api_key']
    message_params = {:from    => 'clients@histeria.io',
                      :to      => @atendee.email,
                      :subject => 'CONGRESO INDUSTRIAL: Codigo de registro',
                      :text    => "Te informamos que tu cuenta para registrarte en congreso industrial ha sido dada de alta,
                      ahora solo necesitas entrar www.congresoindustrial.com.mx/registro con el código"+ @atendee.registration_code +
                      "e introducir tus datos para poder activarla."}
    mg_client.send_message ENV['domain'], message_params
  end
end
