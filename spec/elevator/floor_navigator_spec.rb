require 'spec_helper'

module Elevator
  RSpec.describe FloorNavigator do
    describe "#distance_from" do
      it "returns the distance in number of floors from the given floor in the given shaft state" do
        ground_floor = Floor.new("G")
        first_floor = Floor.new("1")
        second_floor = Floor.new("2")

        navigator = FloorNavigator.new([ground_floor, first_floor, second_floor])

        expect(navigator.directional_distance_between(ground_floor, second_floor)).to eq(2)
        expect(navigator.directional_distance_between(first_floor, ground_floor)).to eq(-1)
        expect(navigator.directional_distance_between(second_floor, second_floor)).to eq(0)
      end
    end
  end
end
