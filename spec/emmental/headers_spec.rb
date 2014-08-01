require 'spec_helper'

describe Emmental::Headers do
  describe "initialize" do
    it "should return an instance of Array subclass" do
      actual = Emmental::Headers.new
      expect(actual).to be_a(Array)
    end

    context "without headers" do
      it "should return an instance of Emmental::Headers" do
        actual = Emmental::Headers.new
        expect(actual).to be_an_instance_of(Emmental::Headers)
      end
    end

    context "with headers Array" do
      it "should return an instance of Emmental::Headers" do
        actual = Emmental::Headers.new(["foo", "bar"])
        expect(actual).to be_an_instance_of(Emmental::Headers)
      end
    end

    context "with header String" do
      it "should return an instance of Emmental::Headers" do
        actual = Emmental::Headers.new("single_header")
        expect(actual).to be_an_instance_of(Emmental::Headers)
      end
    end
  end

  describe "#add_header" do
    it "should add new header" do
      headers = Emmental::Headers.new
      expect{headers.add_header("hoge")}.to change(headers, :size).by(1)
    end

    it "should not add exixting header" do
      headers = Emmental::Headers.new
      headers.add_header("hoge")
      expect{headers.add_header("hoge")}.not_to change(headers, :size)
    end
  end

  describe "#to_a" do
    it "should return Array" do
      array = ["foo", "bar"]
      headers = Emmental::Headers.new(array)
      expect(headers.to_a).to eq array
    end
  end
end
