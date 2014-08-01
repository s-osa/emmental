require "emmental/version"
require "emmental/headers"
require "emmental/row"

class Emmental
  include Enumerable

  attr_accessor :headers
  attr_reader :rows

  def initialize(headers=[])
    @headers = Emmental::Headers.new(headers)
    @rows    = []
  end

  def each
    @rows.each{|row| yield(row) }
  end

  def add_row(hash)
    @rows << Emmental::Row.new(hash, @headers)
  end
  alias :<< :add_row

  def to_a(options={})
    array = (options[:headers] == false) ? [] : [@headers]

    @rows.each do |row|
      array << @headers.map{|header| row.to_h[header] }
    end

    array
  end
end
