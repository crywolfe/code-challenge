require 'rspec'
orig_tree = File.read('data/triangle.txt')
# create a pyramid style 2 dimensional array
class Pyramid
  attr_reader :sum

  def initialize(orig_tree)
    @orig_tree = orig_tree
  end

  def create_2d_array
    @tree = @orig_tree.split(" \n")

    @tree.map! do |num|
      @tree[@tree.index(num)].split(" ")
    end
  end

  # convert the 2d array of strings into 2d array of integers
  def convert_to_ints
    @tree.each_index do |vert_pos|
      @tree[vert_pos].each_index do |horiz_pos|
        @tree[vert_pos][horiz_pos] = @tree[vert_pos][horiz_pos].to_i
      end
    end
  end

  # traverse down the tree following the largest child
  def initial_setup
    # set initial values of vert_pos and sum
    vert_pos = 0
    @sum = @tree[0][0]

    # set initial children nodes
    @initial_child_1 = @tree[1][0]
    @initial_child_2 = @tree[1][1]
  end
  
  def traverse
    largest_child ||= [@initial_child_1, @initial_child_2].max
    for vert_pos in 1...@tree.length
      @sum += largest_child

      # set parent_horiz_pos
      parent_horiz_pos = @tree[vert_pos].index(largest_child)
      parent = largest_child

      if vert_pos < @tree.length-1
        child_1 = @tree[vert_pos+1][parent_horiz_pos]
        child_2 = @tree[vert_pos+1][parent_horiz_pos+1]
      end

      largest_child = [child_1, child_2].max
      # ensure the parent never has a vertical position of the last row
      if vert_pos < @tree.length-1
        # parent = @tree[vert_pos+1][@tree[vert_pos+1].index(largest_child)]
        parent = largest_child
        parent_horiz_pos = @tree[vert_pos+1].index(parent)
      end 
    end
  end

  def sum
    create_2d_array
    convert_to_ints
    initial_setup
    traverse
    @sum
  end
end

pyramid = Pyramid.new(orig_tree)
pyramid.sum

puts "-----"
puts "sum is #{pyramid.sum}"