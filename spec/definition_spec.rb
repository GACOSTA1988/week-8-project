require 'rspec'
require 'definition'
require 'word'
require 'pry'

describe '#Song' do

  before(:each) do
    Word.clear()
    Definition.clear()
    @word = Word.new("Paper", nil)
    @word.save()
  end

  describe('#==') do
    it("is the same definition if it has the same attributes as another definition") do
      definition = Definition.new("Paper", @word.id, nil)
      definition2 = Definition.new("Paper", @word.id, nil)
      expect(definition).to(eq(definition2))
    end
  end

  describe('.all') do
    it("returns a list of all definitions") do
      definition = Definition.new("Paper", @word.id, nil)
      definition.save()
      definition2 = Definition.new("Cutter", @word.id, nil)
      definition2.save()
      expect(Definition.all).to(eq([definition, definition2]))
    end
  end

  describe('.clear') do
    it("clears all definitions") do
      definition = Definition.new("Paper", @word.id, nil)
      definition.save()
      definition2 = Definition.new("Made for writing on", @word.id, nil)
      definition2.save()
      Definition.clear()
      expect(Definition.all).to(eq([]))
    end
  end

  describe('#save') do
    it("saves a definition") do
      definition = Definition.new("Made of paper", @word.id, nil)
      definition.save()
      expect(Definition.all).to(eq([definition]))
    end
  end

  describe('.find') do
    it("finds a definition by id") do
      definition = Definition.new("Made of paper", @word.id, nil)
      definition.save()
      definition2 = Definition.new("Made of gold", @word.id, nil)
      definition2.save()
      expect(Definition.find(definition.id)).to(eq(definition))
    end
  end

  describe('#update') do
    it("updates an definition by id") do
      definition = Definition.new("This is a definition", @word.id, nil)
      definition.save()
      definition.update("This is updated definition", @word.id)
      expect(definition.your_definition).to(eq("This is updated definition"))
    end
  end

  describe('#delete') do
    it("deletes a definition by id") do
      definition = Definition.new("Made of paper", @word.id, nil)
      definition.save()
      definition2 = Definition.new("Made of wood", @word.id, nil)
      definition2.save()
      definition.delete()
      expect(Definition.all).to(eq([definition2]))
    end
  end
  describe('.find_by_word') do
    it("finds definitions for a word") do
      word2 = Word.new("Boat", nil)
      word2.save
      definition = Definition.new("Made to use in the ocean", @word.id, nil)
      definition.save()
      definition = Definition.new("Used to fish", word2.id , nil)
      definition.save()
      expect(Definition.find_by_word(word2.id)).to(eq([definition]))
    end
  end
  describe('#definitions') do
  it("returns a words definitions") do
    words = Word.new("Airplane", nil)
    words.save()
    definition = Definition.new("Carries passengers", words.id, nil)
    definition.save()
    definition2 = Definition.new("Carries cargo", words.id, nil)
    definition2.save()
    expect(words.definitions).to(eq([definition, definition2]))
    end
  end

  describe('#word') do
  it("finds the word a definition belongs to") do
    definition = Definition.new("Paper", @word.id, nil)
    definition.save()
    expect(definition.word()).to(eq(@word))
  end
end

end