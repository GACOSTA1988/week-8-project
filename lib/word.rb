class Word
    attr_accessor :your_choice_word
    @@your_choice_words = []

    def initialize(your_choice_word)
      @your_choice_word = your_choice_word
    end

    def self.all()
        @@your_choice_words
    end
  
    def self.find(your_choice_word)
    end
  
  end