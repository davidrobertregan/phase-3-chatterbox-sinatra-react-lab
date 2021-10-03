class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  get '/messages' do
    sorted = Message.all.sort_by { |m| m.created_at }
    sorted.to_json
  end 

  post '/messages' do 
    message = Message.create(
      body: params[:body],
      username: params[:username],
      created_at: params[:created_at],
      updated_at: params[:updated_at]
    )
    message.to_json
  end

  patch '/messages/:id' do
    message = Message.find params[:id]
    message.update(
      body: params[:body],
      username: params[:username],
      created_at: params[:created_at],
      updated_at: params[:updated_at]
    )
    message.to_json
  end

  delete '/messages/:id' do
    message = Message.find params[:id]
    message.destroy
  end

end
