require 'spec_helper'

describe Emmental do
  describe "initialize" do
    context "without headers" do
      it "should return an instance of Emmental" do
        actual = Emmental.new
        expect(actual).to be_an_instance_of(Emmental)
      end
    end

    context "with headers" do
      it "should return an instance of Emmental" do
        actual = Emmental.new(["foo", "bar"])
        expect(actual).to be_an_instance_of(Emmental)
      end
    end
  end

  describe "headers" do
    let(:emmental){ Emmental.new }

    describe "#headers" do
      it "should return an instance of Emmental::Headers" do
        expect(emmental.headers).to be_an_instance_of(Emmental::Headers)
      end

      it "should contain all headers" do
        emmental << {foo: "bar"}
        emmental << {fizz: "buzz"}
        expect(emmental.headers).to eq [:foo, :fizz]
      end
    end
  end


  describe "rows" do
    let(:emmental){ Emmental.new }

    describe "#<<" do
      it "should increase number of rows" do
        expect{ emmental << {foo: "bar"} }.to change(emmental.rows, :size).by(1)
      end
    end

    describe "#rows" do
      it "should return Array" do
        expect(emmental.rows).to be_an_instance_of(Array)
      end

      it "should contain instances of Emmental::Row" do
        emmental << {foo: "bar"}
        emmental.rows.each do |row|
          expect(row).to be_an_instance_of(Emmental::Row)
        end
      end
    end
  end

  describe "#to_a" do
    before do
      @emmental = Emmental.new(["a_header"])
      @emmental << {foo: 1, "bar" => 2}
      @emmental << {fizz: 3, buzz: 5}
      @emmental << {foo: 1}
      @header = ["a_header", :foo, "bar", :fizz, :buzz]
      @rows = [
        [nil, 1, 2, nil, nil],
        [nil, nil, nil, 3, 5],
        [nil, 1, nil, nil, nil]
      ]
    end

    it "should return rectangle array with headers" do
      expected = [@header].concat(@rows)
      expect(@emmental.to_a).to eq expected
    end

    it "should return rectangle array without headers" do
      expected = @rows
      expect(@emmental.to_a(headers: false)).to eq expected
    end
  end
end
