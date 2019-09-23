require 'sinatra'
require 'ralyxa'
require 'sinatra/reloader' if development?

get '/' do
  'works! '
end

post '/' do
  Ralyxa::Skill.handle(request)
end
