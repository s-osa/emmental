class Emmental
  class Headers < Array
    def initialize(headers=[])
      super([headers].flatten)
    end

    def add_header(header)
      self << header unless self.include?(header)
    end
  end
end
