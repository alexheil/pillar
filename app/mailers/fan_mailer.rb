class FanMailer < ApplicationMailer

	def post_email(fan, artist, artist_post)
	  @fan = fan
	  @artist = artist
	  @post = artist_post.first
	  mail(to: @fan.email, subject: 'Sent some posts | Noisaea')
	end

	def photo_email(fan, artist, artist_photo)
	  @fan = fan
	  @artist = artist
	  @photo = artist_photo.first
	  mail(to: @fan.email, subject: 'Sent some posts | Noisaea')
	end

	def video_email(fan, artist, artist_video)
	  @fan = fan
	  @artist = artist
	  @video = artist_video.first
	  mail(to: @fan.email, subject: 'Sent some posts | Noisaea')
	end

	def tour_email(fan, artist, artist_tour)
	  @fan = fan
	  @artist = artist
	  @tour = artist_tour.first
	  mail(to: @fan.email, subject: 'Sent some posts | Noisaea')
	end

	def merch_email(fan, artist, artist_item)
	  @fan = fan
	  @artist = artist
	  @item = artist_item.first
	  mail(to: @fan.email, subject: 'Sent some posts | Noisaea')
	end

	def album_email(fan, artist, artist_album)
	  @fan = fan
	  @artist = artist
	  @album = artist_album.first
	  mail(to: @fan.email, subject: 'Sent some posts | Noisaea')
	end

end