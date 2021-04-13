class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  skip_before_action :verify_authenticity_token, if: :devise_controller?, raise: false

  def update_user_frontend(current_user)
    render json: current_user.to_json(include: [study_sets:{ include: :words }])
  end

end
