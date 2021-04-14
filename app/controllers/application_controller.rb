class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken

  def update_user_frontend(current_user)
    render json: current_user.to_json(include: [study_sets:{ include: :words }])
  end

end
