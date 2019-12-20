require 'rspec'
require 'word'
require 'definition'

describe '#Word' do
describe(".all") do
    it("This will return an empty array") do
      expect(Word.all()).to(eq([]))
    end
  end

  describe('#save') do
  it("will save a word") do
    test_word = Word.new("Plate", nil) 
    test_word.save()
    test_word2 = Word.new("Paper", nil) 
    test_word2.save()
    expect(Word.all).to(eq([test_word, test_word2]))
  end
end
describe('#==') do
it("Checks to see if your_choice_word is the same as another by attribute only") do
  test_word = Word.new("Paper", nil)
  test_word2 = Word.new("Paper", nil)
  expect(test_word).to(eq(test_word2))
end
end
end



