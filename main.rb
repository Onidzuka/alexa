require 'sinatra'
require 'ralyxa'
require 'sinatra/reloader' if development?

post '/' do
  puts "Processing request!"

  Ralyxa::Skill.handle(request)
end
