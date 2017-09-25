class CallbacksController < Devise::OmniauthCallbacksController
  def meetup
    @member = Member.from_omniauth(request.env["omniauth.auth"])

    if @member.persisted?
      sign_in(@member, event: :authentication)
      redirect_to after_sign_in_path_for(@member)
    end
  end
end
