class ApplicationController < ActionController::Base

    private
 
    def after_sign_in_path_for(resource)
       "/show/index"
    end
    
    def after_sign_up_path_for(resource)
        "/users/sign_up"
     end
end
# rails generate scaffold profile name 'price:decimal{7,2}' 