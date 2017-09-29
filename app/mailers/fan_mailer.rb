class FanMailer < ApplicationMailer

	def post_email(fan)
	  @fan = fan
	  @aritst = artist
	  @post = artist_post
	  mail(to: @fan.email, subject: 'Sent some posts | Noisaea')
	end

	def photo_email(fan)
	  @fan = fan
	  @aritst = artist
	  @photo = artist_photo
	  mail(to: @fan.email, subject: 'Sent some posts | Noisaea')
	end

	def video_email(fan)
	  @fan = fan
	  @aritst = artist
	  @video = artist_video
	  mail(to: @fan.email, subject: 'Sent some posts | Noisaea')
	end

	def merch_email(fan)
	  @fan = fan
	  @aritst = artist
	  @merch = artist_merch
	  mail(to: @fan.email, subject: 'Sent some posts | Noisaea')
	end

	def tour_email(fan)
	  @fan = fan
	  @aritst = artist
	  @tour = artist_tour
	  mail(to: @fan.email, subject: 'Sent some posts | Noisaea')
	end

	def merch_email(fan)
	  @fan = fan
	  @aritst = artist
	  @item = artist_item
	  mail(to: @fan.email, subject: 'Sent some posts | Noisaea')
	end

	def album_email(fan)
	  @fan = fan
	  @aritst = artist
	  @album = artist_album
	  mail(to: @fan.email, subject: 'Sent some posts | Noisaea')
	end

end