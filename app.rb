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

get('/words/:id/definitions/:definition_id') do
  @definition = Definition.find(params[:definition_id].to_i())
  erb(:definition)
end

post('/words/:id/definitions') do
  @word = Word.find(params[:id].to_i())
  definition = Definition.new(params[:word_definition], @word.id, nil)
  definition.save()
  erb(:word)
end

patch('/words/:id/definitions/:definition_id') do
  @word = Word.find(params[:id].to_i())
  definition = Definition.find(params[:definition_id].to_i())
  definition.update(params[:your_definition], @word.id)
  erb(:word)
end

delete('/words/:id/definitions/:definition_id') do
  definition = Definition.find(params[:definition_id].to_i())
  definition.delete
  @word = Word.find(params[:id].to_i())
  erb(:word)
end