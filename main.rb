require 'sinatra'
require 'ralyxa'
require 'dotenv'
require 'active_support/all'
require 'sinatra/reloader' if development?

Dotenv.load

get '/' do
  'works! '
end

post '/' do
  Ralyxa::Skill.handle(request)
end
