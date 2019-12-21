require 'rspec'
require 'definition'
require 'word'
require 'pry'

describe '#Word_Definition' do

  before(:each) do
    Word.clear()
    Definition.clear()
    @definition = Word_definition.new("Boat", nil)
    @album.save()
  end

  describe('#==') do
    it("is the same definition if it has the same attributes as another definition") do
      definition = SonWord_definitiong.new("This is a definition", @definition.id, nil)
      definition2 = Word_definition.new("This is a definition", @definition.id, nil)
      expect(definition).to(eq(definition2))
    end
  end

  describe('.all') do
    it("returns a list of all definitions") do
      definition = Word_definition.new("This is a definition", @definition.id, nil)
      definition.save()
      definition2 = Word_definition.new("This is another definition", @definition.id, nil)
      definition2.save()
      expect(Word_definition.all).to(eq([definition, definition2]))
    end
  end

  describe('.clear') do
    it("clears all defintions") do
      definition = Word_definition.new("This is a definition", @definition.id, nil)
      definition.save()
      definition2 = Word_definition.new("This is another defintion", @definition.id, nil)
      definition2.save()
      Word_definition.clear()
      expect(Word_definition.all).to(eq([]))
    end
  end

  describe('#save') do
    it("saves a definition") do
      definition = Word_definition.new("This is a definition", @definition.id, nil)
      definition.save()
      expect(Word_definition.all).to(eq([definition]))
    end
  end

  describe('.find') do
    it("finds a definition by id") do
      definition = Word_definition.new("This is a definition", @definition.id, nil)
      definition.save()
      definition2 = Word_definition.new("This is another definition", @definition.id, nil)
      definition2.save()
      expect(Word_definition.find(definition.id)).to(eq(definition))
    end
  end

  describe('#update') do
    it("updates a definition by id") do
      definition_test = Word_definition.new("This is a definotion", @definition.id, nil)
      definition_test.save()
      definition_test.update("This is an updated definition", @definition.id)
      expect(definition_test.definition).to(eq("This is an updated definition"))
    end
  end

  describe('#delete') do
    it("deletes an definition by id") do
      definition = Word_definition.new("This is a definition", @definition.id, nil)
      definition.save()
      definition2 = Word_definition.new("This is another defintion", @definition.id, nil)
      definition2.save()
      definition1.delete()
      expect(Word_definition.all).to(eq([song2]))
    end
  end
end