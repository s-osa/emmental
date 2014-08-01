class Emmental
  class Row
    attr_accessor :headers

    def initialize(hash, headers)
      @hash = hash
      @headers = headers

      hash.each_key do |header|
        @headers.add_header(header)
      end
    end

    def to_h
      @hash
    end
  end
end
