class ChatroomChannel < ApplicationCable::Channel
  
  # include Knock::Authenticable
   
  
  def subscribed
    puts "This is #{params["token"]}"
  
    
    # stream_from "some_channel"
    #this looks for a specific conversation that the user is 'subscribed to'
    # @chatrooom = Chatroom.find params[:room]
    # @chatrooom = Chatroom.find(6) #For testing
    
    stream_for "room_#{params[:room]}"
    
  end

  def receive(data)
     
    verify_user= find_verified_user(data["token"])
  
    @message = Message.create content: data["content"], user_id: verify_user.id, chatroom_id: data["chatroom_id"]

    ChatroomChannel.broadcast_to("room_#{params[:room]}", @message)
    

  end

 

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def find_verified_user  token

  
    decoded_token = JWT.decode token, "secret", true, { :algorithm => "HS256" }
    p "decoded-token", decoded_token
    verify_user = User.find((decoded_token[0])["sub"])
      if verify_user.present?
        
        verify_user
      else
        reject_unauthorized_connection
      end
  end
         
        
  


  
end
