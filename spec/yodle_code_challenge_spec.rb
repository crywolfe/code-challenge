require "spec_helper"
require_relative "../yodle_code_challenge"

describe Pyramid do
  let(:tree) { "5 
    10 2 
    40 1 4 
    1 4 10 20 " }
  let (:pyramid) { Pyramid.new(tree) }

  describe "#create_2d_array" do
    it "should create a 2d array from a string that mimics a pyramid" do
      
      triangle_array = [
      ["5"], 
      ["10", "2"],
      ["40", "1", "4"],
      ["1", "4", "10", "20"]]

      expect(pyramid.create_2d_array).to eq(triangle_array)
    end
  end

  describe "#convert_to_ints" do
    it "should convert all number strings in the array to integers" do

      pyramid.create_2d_array

      tree_int = 
        [[5], 
        [10, 2],
        [40, 1, 4],
        [1, 4, 10, 20]]

      expect(pyramid.convert_to_ints).to eq(tree_int)
    end
  end

  describe "#traverse" do
    it "should traverse down the array looking for the largest direct child of the parent node and return the sum" do

      pyramid.create_2d_array
      pyramid.convert_to_ints
      pyramid.traverse

      expect(pyramid.sum).to eq(59)
    end
  end
end



