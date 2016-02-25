class SessionsController < Devise::SessionsController

  def create
    resource = warden.authenticate!(:scope => resource_name, :recall => :failure)
    return invalid_login_attempt unless resource
    sign_in(resource_name, resource)
    render :json => { :success => true, :auth_token => resource.authentication_token, :user => resource }
  end

  def destroy
    # warden.authenticate!(:scope => resource_name, :recall => :failure)
    # sign_out()
    # render :json => { :info => "Logged out" }, :status => 200
    token = params[:auth_token]
    @admin = Admin.find_by_authentication_token(token)
    @admin.reset_authentication_token!
    sign_out(@admin)
    render json: {message: "You have successfully logged out"}
  end

  # def failure
  #   return render :json => {:success => false, :errors => ["Login failed."]}
  # end
end