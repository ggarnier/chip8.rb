require_relative 'spec_helper'

describe Operation do
  describe "#for" do
    it "should accept set operations" do
      assert_instance_of SetOperation, Operation.for(0x6137)
    end

    it "should accept end operations" do
      assert_instance_of EndOperation, Operation.for(0x0000)
    end

    it "should accept skip operations" do
      assert_instance_of SkipOperation, Operation.for(0x3100)
    end

    it "should accept jump operations" do
      assert_instance_of JumpOperation, Operation.for(0x1003)
    end

    it "should accept increment operations" do
      assert_instance_of IncrementOperation, Operation.for(0x7301)
    end
  end
end
