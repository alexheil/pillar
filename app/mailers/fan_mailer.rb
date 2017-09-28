class FanMailer < ApplicationMailer

	def post_email(fan)
	  @fan = fan
	  mail(to: @fan.email, subject: 'Sent some posts | Noisaea')
	end

end