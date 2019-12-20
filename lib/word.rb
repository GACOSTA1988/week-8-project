class Word
    attr_accessor :your_choice_word, :id
    @@your_choice_words = {}
    @@total_rows = 0

    def initialize(your_choice_word, id)
      @your_choice_word = your_choice_word
      @id = id || @@total_rows += 1
    end

    def self.all()
        @@your_choice_words.values
    end
  
    def self.find(your_choice_word)
    end

    def ==(word_to_compare)
        self.your_choice_word() == word_to_compare.your_choice_word()
      end

    def save
        @@your_choice_words[self.id] = Word.new(self.your_choice_word, self.id)
    end

    def self.clear
        @@your_choice_words = {}
        @@total_rows = 0
      end

      def self.find(id)
        @@your_choice_words[id]
      end

      def update(your_choice_word)
        @your_choice_word = your_choice_word
      end

      def delete
        @@your_choice_words.delete(self.id)
      end

      def self.search(x)
        @@your_choice_words.values.select { |e| /#{x}/i.match? e.your_choice_word}
      end

      def self.sorter
        @@your_choice_words.values.sort_by { |word| word.your_choice_word}
      end
    
end
