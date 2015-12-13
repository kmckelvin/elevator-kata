require 'spec_helper'

module Elevator
  module Instructions
    RSpec.describe Dropoff do
      describe "#to_s" do
        it "returns a string 'Dropoff' with the floor label" do
          floor = Floor.new("G")
          dropoff = Dropoff.new(floor)
          expect(dropoff.to_s).to eq "Dropoff on level G"
        end
      end
    end
  end
end
