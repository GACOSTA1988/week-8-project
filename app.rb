require('sinatra')
require('sinatra/reloader')
require('./lib/word') #UPDATE PARENT CLASS
require('pry')
require('./lib/definition') #UPDATE CHILD CLASS
also_reload('lib/**/*.rb')
