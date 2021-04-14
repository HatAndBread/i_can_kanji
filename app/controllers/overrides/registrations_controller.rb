module Overrides
  class RegistrationsController < DeviseTokenAuth::RegistrationsController
    def render_create_success
        if current_user
            render json: current_user.to_json(include: [study_sets:{ include: :words }])
        end
    end
  end
end