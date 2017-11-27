require 'singleton'
require_relative 'dictionary'

module NATO
  class Parser
    include Singleton

    def natify(text)
      text.split('').map do |piece|
        DICTIONARY.fetch piece.downcase.to_sym
      end
    end

    def natify2(text, join_with: nil, separator: '')
      join_with = join_with === true ? 'as in' : join_with.to_s

      result = text.split('').map do |piece|
        natified = DICTIONARY.fetch piece.downcase.to_sym
        "#{piece} #{join_with} #{natified}"
      end

      result.join(separator)
    end

    alias_method :to_nato, :natify
  end
end
