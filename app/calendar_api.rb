require 'sinatra'
#require_relative 'event'

class Calendar < Sinatra::Base
  #before do
  #  content_type :json
  #end
#
  #get '/api/v1/' do
  #  events = Event.all
#
  #  return {msg: "Nenhum evento criado"}.to_json if events.empty?
#
  #  events.to_json
  #end

  get '/' do
    'hello'
  end
end