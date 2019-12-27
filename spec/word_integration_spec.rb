require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('create a word path', {:type => :feature}) do
    it('creates a word and then goes to the word page') do
      visit('/words')
      save_and_open_page
      click_on('Add a new word!')
      fill_in('term_word', :with => 'Paper')
      click_on('Create!')
      expect(page).to have_content('Paper')
    end
  end

  describe('create a definition path', {:type => :feature}) do
    it('creates a word and then goes to the word page') do
      word = Word.new("Train", nil)
      word.save
      visit("/words/#{word.id}")
      fill_in('word_definition', :with => 'Used to move passengers')
      click_on('Add definition')
      expect(page).to have_content('Used to move passengers')
    end
  end