require 'rspec'
require 'word'
require 'definition'

describe '#Word' do
before(:each) do
    Word.clear()
  end

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

describe('.clear') do
    it("will test if clear method clears @@words") do
      test_word = Word.new("Air plane", nil)
      test_word.save()
      test_word2 = Word.new("Water", nil)
      test_word2.save()
      Word.clear()
      expect(Word.all).to(eq([]))
    end
  end

describe('.find') do
    it("finds a word by id") do
      test_word = Word.new("Gator", nil)
      test_word.save()
      test_word2 = Word.new("Boar", nil)
      test_word2.save()
      expect(Word.find(test_word.id)).to(eq(test_word))
    end
  end

  describe('#update') do
  it("updates a word by id") do
    test_word = Word.new("Fly", nil)
    test_word.save()
    test_word.update("Plane")
    expect(test_word.your_choice_word).to(eq("Plane"))
  end
end

end



