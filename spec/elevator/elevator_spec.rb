require 'spec_helper'

module Elevator
  RSpec.describe Elevator do
    it "is initialized in a stopped state" do
      elevator = Elevator.new(current_floor: nil)
      expect(elevator.motion).to eq :stopped
    end

    describe "#stopped?" do
      context "when moving up" do
        it "returns false" do
          elevator = Elevator.new(current_floor: nil, motion: :up)
          expect(elevator).not_to be_stopped
        end
      end

      context "when stopped" do
        it "returns true" do
          elevator = Elevator.new(current_floor: nil, motion: :stopped)
          expect(elevator).to be_stopped
        end
      end
    end
  end
end
