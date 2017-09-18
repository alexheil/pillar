class StaticPagesController < ApplicationController

	before_action :redirect_if_signed_in, only: [:register, :sign_in]

	def home
	end

	def about
	end

	def terms_of_use
	end

	def privacy_policy
	end

	def faq
	end

	def stats
	end

	def why
	end

	def register
	end

	def sign_in
	end

	private

		def redirect_if_signed_in
	    if artist_signed_in?
	      redirect_to root_url
	      flash[:notice] = "You are signed in!"
	    end
	  end

end