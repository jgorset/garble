require "garble/version"

require "dinosaurus"

module Garble

  class << self

    def run(stdin, key)
      key ||= ENV['GARBLE_KEY']

      error 'No STDIN given' unless stdin
      error 'No Big Huge Thesaurus key given' unless key

      Dinosaurus.configure do |config|
        config.api_key = key
      end

      bits = stdin.read.split " "

      bits.each do |bit|
        matches = bit.match /([a-zA-Z0-9-]*)([\r\n .,!?:;]?)/

        original_word = matches[1]
        punctuation   = matches[2]

        if original_word
          word = Dinosaurus.synonyms_of(original_word).sample || original_word

          if original_word =~ /^[A-Z]/
            word.capitalize!
          end

          print word
        end

        if punctuation
          print punctuation
        end

        print " "
      end

      puts
    end

    def error(message)
      puts message
      exit
    end

  end

end
