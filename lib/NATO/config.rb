module NATO
  module Config
    extend self

    attr_accessor :dictionary

    def reset
      self.dictionary = nil
    end

    reset
  end

  class << self
    def configure
      block_given? ? yield(Config) : Config
    end

    def config
      Config
    end
  end
end
