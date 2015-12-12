require 'spec_helper'

module Elevator
  RSpec.describe RunLoop do
    describe "#tick" do
      context "with no movement instructions" do
        it "does nothing" do
          ground_floor = Floor.new("G")
          floors = [ground_floor]

          elevator = Elevator.new(current_floor: ground_floor)

          initial_shaft_state = ShaftState.new(floors, elevator)

          run_loop = RunLoop.new

          next_shaft_state = run_loop.tick(initial_shaft_state)

          expect(next_shaft_state).to eq initial_shaft_state
        end
      end
    end
  end
end
