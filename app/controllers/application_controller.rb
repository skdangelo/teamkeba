class ApplicationController < ActionController::Base
     protect_from_forgery with: :exception

     before_action :configure_permitted_parameters, if: :devise_controller?

     protected

          def configure_permitted_parameters
               devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:firstname, :lastname, :gender, :cell,
                :playeremail, :parent1, :parent1cell, :parent2, :parent2email, :parent2cell, :location, :homeaddress,
                :homecity, :homestate, :homezip, :school, :yearschool, :dob, :position1, :position2, :referredby,
                :email, :password, :admin)}

               devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:firstname, :lastname, :gender, :cell,
                :playeremail, :parent1, :parent1cell, :parent2, :parent2email, :parent2cell, :location, :homeaddress,
                :homecity, :homestate, :homezip, :school, :yearschool, :dob, :position1, :position2, :referredby,
                :email, :password, :current_password, :admin)}
          end
end
