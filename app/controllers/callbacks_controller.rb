class CallbacksController < Devise::OmniauthCallbacksController
  skip_authorization_check

  def meetup
    @member = Member.from_omniauth(request.env["omniauth.auth"])

    if @member.persisted?
      sign_in(@member, event: :authentication)
      redirect_to after_sign_in_path_for(@member)
    end
  end
end
