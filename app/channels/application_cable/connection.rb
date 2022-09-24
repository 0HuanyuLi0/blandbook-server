module ApplicationCable
  class Connection < ActionCable::Connection::Base
   
    #On connection, ensure that the user is the correct one.
 
  def connect   

    find_verified_user 
  end
 
private

  # ! Thanks to  https://itnext.io/actioncable-authentication-in-a-token-based-rails-api-f9cc4b8bf560


def find_verified_user   

  token = request.headers[:HTTP_SEC_WEBSOCKET_PROTOCOL].split(" ").last
  decoded_token = JWT.decode token, "secret", true, { :algorithm => "HS256" }
  p "decoded-token", decoded_token
  @current_user = User.find((decoded_token[0])["sub"])
    if @current_user.present?
      
      @current_user
    else
      reject_unauthorized_connection
    end
  end

 
  end #end method
end #end class
