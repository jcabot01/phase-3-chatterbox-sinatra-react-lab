require 'pry'

class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add routes
  get '/messages' do
    # binding.pry
    messages = Message.all.order(params[:created_at]) # return array of all messages as JSON in asc order based on created_at
    messages.to_json
  end

  post '/messages' do
    message = Message.create( #creates a new message with body and username from params, and returns new post as JSON
      body: params[:body],
      username: params[:username]
    )
    message.to_json
  end

  patch '/messages/:id' do
    message = Message.find(params[:id])  #updates the body of the message using params :id, and returns updated message as JSON 
    message.update(
      body: params[:body]
    )
    message.to_json 
  end

  delete '/messages/:id' do
    message = Message.find(params[:id])  #deletes message, based on params :id, and the .destroy method
    message.destroy
  end

end
