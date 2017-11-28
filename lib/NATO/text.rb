require_relative 'parser'
require_relative 'say'

module NATO
  class Text
    attr_reader :original, :natified, :pronunciation
    attr_reader :join_with, :separator, :humanized

    def initialize(sentence, humanized: false, join_with: '', separator: ' ')
      @original = sentence
      @humanized = humanized
      @join_with = humanized ? 'as in' : join_with
      @separator = humanized ?  ', ' : separator

      natify sentence
    end

    alias_method :to_nato, :natified
    alias_method :to_s, :to_nato

    def say
      NATO::Say.(self)
    end

    private

    def natify(sentence)
      Parser.instance.natify(sentence).tap do |natified|
        @natified = nato_only(natified).join(@separator)
        @pronunciation = natified.map(&:last).join(@separator)
      end
    end

    def is_number?(text)
      %w(zero one two three four five six seven eight nine).include? text.to_s.downcase
    end

    def nato_only(nato_map)
      join_with = @join_with === true ? 'as in' : @join_with.to_s

      res = nato_map.map do |nato_piece|
        nato_piece = nato_piece.first
        piece = nato_piece[0].to_s.downcase

        if is_number?(nato_piece) || join_with.empty?
          nato_piece
        else
        "#{piece.upcase} #{join_with} #{nato_piece}"
        end
      end

      res
    end
  end
end
