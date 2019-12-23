require('sinatra')
require('sinatra/reloader')
require('./lib/word') 
require('pry')
require('./lib/definition') 
also_reload('lib/**/*.rb')

get('/') do
  @your_choice_words = Word.all
  erb(:words)
end

get('/words') do
  if params["search"]
    @your_choice_words = Word.search(params[:search])
  elsif params["sort"]
    @your_choice_words = Word.sorter
  else
    @your_choice_words = Word.all
  end
  erb(:words)
end

get('/words/new') do
  erb(:new_word)
end

post('/words') do
  your_choice_word = params[:term_word]
  word = Word.new(your_choice_word, nil)
  word.save()
  @your_choice_words = Word.all()
  erb(:words)
end

get('/words/:id') do
  @your_choice_word = Word.find(params[:id].to_i())
  erb(:word)
end

get('/words/:id/edit') do
  @your_choice_word = Word.find(params[:id].to_i())
  erb(:edit_word)
end

patch('/words/:id') do
  your_choice_word = Word.find(params[:id].to_i())
  your_choice_word.update(params[:your_choice_word])
  @your_choice_words = Word.all
  erb(:words)
end

delete('/words/:id') do
  your_choice_word = Word.find(params[:id].to_i())
  your_choice_word.delete()
  @your_choice_words = Word.all
  erb(:words)
end
