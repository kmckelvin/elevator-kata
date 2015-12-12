require 'spec_helper'

module Elevator
  RSpec.describe RunLoop do
    describe "#tick" do
      context "with no movement instructions" do
        it "does nothing" do
          ground_floor = Floor.new("G")
          floors = [ground_floor]

          elevator = Elevator.new(current_floor: ground_floor)

          initial_shaft_state = ShaftState.new(floors, elevator, [])

          run_loop = RunLoop.new

          next_shaft_state = run_loop.tick(initial_shaft_state)

          expect(next_shaft_state).to eq initial_shaft_state
        end
      end

      context "with a request to go to the first floor" do
        it "goes to the first floor after ticking" do
          ground_floor = Floor.new("G")
          first_floor = Floor.new("1")
          floors = [ground_floor, first_floor]

          elevator = Elevator.new(current_floor: ground_floor)

          instruction = Instructions::PickupRequest.new(first_floor, :down)

          initial_shaft_state = ShaftState.new(floors, elevator, [instruction])

          run_loop = RunLoop.new

          moving_shaft_state = run_loop.tick(initial_shaft_state)
          final_shaft_state = run_loop.tick(moving_shaft_state)

          expected_final_elevator = Elevator.new(current_floor: first_floor)
          expect(final_shaft_state).to eq ShaftState.new(floors, expected_final_elevator, [])
        end
      end
    end
  end
end
