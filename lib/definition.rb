class Definition
    attr_reader :id
    attr_accessor :your_definition, :word_id
  
    @@definitions = {}
    @@total_rows = 0
  
    def initialize(your_definition, word_id, id)
      @your_definition = your_definition
      @word_id = word_id
      @id = id || @@total_rows += 1
    end
  
    def ==(definition_to_compare)
      (self.your_definition() == definition_to_compare.your_definition()) && (self.word_id() == definition_to_compare.word_id())
    end
  
    def self.all
      @@definitions.values
    end
  
    def save
      @@definitions[self.id] = Definition.new(self.your_definition, self.word_id, self.id)
    end
  
    def self.find(id)
      @@definitions[id]
    end
  
    def update(your_definition, word_id)
      self.your_definition = your_definition
      self.word_id = word_id
      @@definitions[self.id] = Definition.new(self.your_definition, self.word_id, self.id)
    end
  
    def delete
      @@definitions.delete(self.id)
    end
  
    def self.clear
      @@definitions = {}
    end

    def self.find_by_word(word_id)
        definitions = []
        @@definitions.values.each do |definition|
          if definition.word_id == word_id
            definitions.push(definition)
          end
        end
        definitions
      end
      
      def word
        Word.find(self.word_id)
      end
      
  end