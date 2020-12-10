require 'Sequence'

describe Sequence do

  describe "#value" do

    it "return value of new Sequence" do
      expect(Sequence.new.value).to eql("1")
    end

  end

  describe "#next_number" do
    it "returns next new Sequence" do
      expect(Sequence.new.next_number).to eql("11")
    end
  end

  describe "get" do

    it "returns get(3)" do
      expect(expect(Sequence.new.get(3)).to eql("1" + "\n11" + "\n21" + "\n1211"))
    end

    it "returns get(4)" do
      expect(expect(Sequence.new.get(4)).to eql("1" + "\n11" + "\n21" + "\n1211" + "\n111221"))
    end
  end
end