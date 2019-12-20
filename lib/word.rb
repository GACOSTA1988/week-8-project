class Word
    attr_accessor :your_choice_word, :id
    @@your_choice_words = {}
    @@total_rows = 0

    def initialize(your_choice_word, id)
      @your_choice_word = your_choice_word
      @id = id || @@total_rows += 1
    end

    def self.all()
        @@your_choice_words.values()
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

  end
