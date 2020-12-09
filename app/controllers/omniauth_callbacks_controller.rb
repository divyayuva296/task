class OmniauthCallbacksController < Devise::OmniauthCallbacksController 
	 	def google_oauth2
 
      # You need to implement the method below in your model (e.g. app/models/user.rb)
      auth = request.env['omniauth.auth']
      @user = User.from_omniauth(auth,current_user)
      if @user.persisted?
        flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: 'Google'
        sign_in_and_redirect @user, event: :authentication
      else
        session['devise.google_data'] = request.env['omniauth.auth'].delete_if{|key, value| key == "extra"}
        #.select { |k, v| k == "email" } # Removing extra as it can overflow some session stores
        redirect_to new_user_registration_url, alert: @user.errors.full_messages.join("\n")
      end
  	end

	 def linkedin 
	 		auth = request.env["omniauth.auth"] 
	 		@user = User.connect_to_linkedin(auth,current_user) 
	 		if @user.persisted? 
	 			flash[:notice] = I18n.t "devise.omniauth_callbacks.success" 
	 			sign_in_and_redirect @user, :event => :authentication 
	 		else 
	 			session["devise.linkedin_uid"] = request.env["omniauth.auth"].delete_if{|key, value| key == "extra"}
	 			redirect_to new_user_registration_url 
	 		end
	 end
end