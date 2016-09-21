require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)!
 Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:brownie) { Dessert.new("brownie", 100) }

  describe "#initialize" do
    it "sets a type" do
      expect(brownie.type).to eq("brownie")
    end

    it "sets a quantity" do
      expect(brownie.quantity).to be_a(Integer)
      expect(brownie.quantity).to be > 0
    end

    it "starts ingredients as an empty array" do
      expect(brownie.ingredients).to eq([])
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("cake", "tons") }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      brownie.add_ingredient("baking soda")
      expect(brownie.ingredients.length).to eq(1)
    end
  end

  describe "#mix!" do

    let (:freq) {Hash.new{|h, k| h[k] = 0}}

    before (:each) do
      brownie.add_ingredient("baking soda")
      brownie.add_ingredient("chocolate chips")
      brownie.add_ingredient("sugar")
    end

    it "shuffles the ingredient array" do
      100.times do
        brownie.mix!
        freq[brownie.ingredients[0]] += 1
      end
      expect(freq["sugar"]).to be > 0
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      brownie.eat(10)
      expect(brownie.quantity).to eq(90)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect{brownie.eat(200)}.to raise_error("not enough left!")
    end
  end
end
