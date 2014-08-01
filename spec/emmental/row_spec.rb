require 'spec_helper'

describe Emmental::Row do
  let(:row){  Emmental::Row.new({foo: 1, "bar" => 2}, Emmental::Headers.new) }

  describe "initialize" do
    it "should return an instance of Emmental::Row" do
      expect(row).to be_an_instance_of(Emmental::Row)
    end

    it "should add headers to Emmental::Headers" do
      expect(row.headers.size).to be > 0

      row.headers.each do |header|
        expect(row.headers).to include(header)
      end
    end
  end

  describe "#headers" do
    it "should return an instance of Emmental::Headers" do
      expect(row.headers).to be_an_instance_of(Emmental::Headers)
    end
  end

  describe "#to_h" do
    it "should return Hash" do
      hash = {foo: 1, "bar" => 2}
      row = Emmental::Row.new(hash, Emmental::Headers.new)
      expect(row.to_h).to eq hash
    end
  end
end
