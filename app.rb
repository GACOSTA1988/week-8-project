require('sinatra')
require('sinatra/reloader')
require('./lib/word') #UPDATE PARENT CLASS
require('pry')
require('./lib/definition') #UPDATE CHILD CLASS
also_reload('lib/**/*.rb')

get('/') do
  @your_choice_words = Word.all
  erb(:words)
end

get('/words') do
  @your_choice_words = Word.all
  erb(:words)
end