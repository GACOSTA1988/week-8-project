class Word_Definition
    attr_reader :id
    attr_accessor :definition, :word_id
  
    @@definitions = {}
    @@total_rows = 0
  
    def initialize(definition, word_id, id)
      @definition = definition
      @word_id = word_id
      @id = id || @@total_rows += 1
    end
  
    def ==(definition_to_compare)
      (self.definition() == definition_to_compare.definition()) && (self.word_id() == definition_to_compare.word_id())
    end
  
    def self.all
      @@definitions.values
    end
  
    def save
      @@definitions[self.id] = Word_Definition.new(self.definition, self.word_id, self.id)
    end
  
    def self.find(id)
      @@definitions[id]
    end
  
    def update(definition, word_id)
      self.definition = definition
      self.word_id = word_id
      @@definitions[self.id] = Word_Definition.new(self.definition, self.word_id, self.id)
    end
  
    def delete
      @@songs.delete(self.id)
    end
  
    def self.clear
      @@songs = {}
    end
  end