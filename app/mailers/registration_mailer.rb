class RegistrationMailer < ApplicationMailer
  default from: "clients@histeria.io"

  def sample_email(atendee)
    @atendee = atendee
    mg_client = Mailgun::Client.new ENV['api_key']
    message_params = {:from    => 'participantes.ci23@gmail.com',
                      :to      => @atendee.email,
                      :subject => 'Bienvenido/a a Congreso Industrial',
                      :text    => "¡Hola!

Por parte del equipo de Congreso Industrial 23, te damos la bienvenida como participante a este gran evento, que se llevara acabo del 25 al 27 de agosto en el Auditorio Luis Elizondo, en el Tecnológico de Monterrey, Campus Monterrey.

Para registrarte al sistema de inscripciones, en donde podrás escoger el taller y/o visita de tu preferencia, deberás entrar a http://www.inscripciones-ci.xyz/confirmacion_registro y usar el código " + @atendee.registration_code + ". Tu fecha de inscripción aparecerá una vez que te hayas dado de alta.

IMPORTANTE: Es muy importante que selecciones un taller y una visita en diferentes días.

Si tienes cualquier duda o comentario al momento de registrarte o inscribirte, puedes escribirnos a participantes.ci23@gmail.com.

Agradecemos tu interés por Congreso Industrial, en donde nuestro principal objetivo es que puedas trascender con todos los talleres, visitas, conferencias y actividades que tenemos planeadas para ti.

¡Nos vemos en Agosto!"}
    mg_client.send_message ENV['domain'], message_params
  end
end
