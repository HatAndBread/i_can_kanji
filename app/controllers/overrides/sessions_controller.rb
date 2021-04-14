module Overrides
  class SessionsController < DeviseTokenAuth::SessionsController
    def render_create_success
        if current_user
            render json: current_user.to_json(include: [study_sets:{ include: :words }])
        end
    end
  end
end