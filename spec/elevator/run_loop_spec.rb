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

      context "with a stop instruction" do
        it "stops at the current floor and removes the instruction from the queue" do
          ground_floor = Floor.new("G")
          floors = [ground_floor]

          elevator = Elevator.new(current_floor: ground_floor, motion: :up)

          initial_shaft_state = ShaftState.new(floors, elevator, [Instructions::Stop.new])

          run_loop = RunLoop.new

          next_shaft_state = run_loop.tick(initial_shaft_state)

          stopped_elevator = Elevator.new(current_floor: ground_floor, motion: :stopped)
          expect(next_shaft_state).to eq ShaftState.new(floors, stopped_elevator, [])
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

      context "with a request ot go to the ground floor" do
        it "goes to the ground floor after ticking" do
          ground_floor = Floor.new("G")
          first_floor = Floor.new("1")
          floors = [ground_floor, first_floor]

          elevator = Elevator.new(current_floor: first_floor)

          instruction = Instructions::PickupRequest.new(ground_floor, :down)

          initial_shaft_state = ShaftState.new(floors, elevator, [instruction])

          run_loop = RunLoop.new

          moving_shaft_state = run_loop.tick(initial_shaft_state)
          final_shaft_state = run_loop.tick(moving_shaft_state)

          expected_final_elevator = Elevator.new(current_floor: ground_floor)
          expect(final_shaft_state).to eq ShaftState.new(floors, expected_final_elevator, [])
        end
      end

      context "with a pickup request on first floor, dropoff on ground floor" do
        it "moves up, then moves back down" do
          ground_floor = Floor.new("G")
          first_floor = Floor.new("1")
          floors = [ground_floor, first_floor]

          elevator = Elevator.new(current_floor: ground_floor)

          instruction = Instructions::PickupRequest.new(first_floor, :down)
          initial_shaft_state = ShaftState.new(floors, elevator, [instruction])

          run_loop = RunLoop.new

          moving_shaft_state = run_loop.tick(initial_shaft_state)
          first_floor_shaft_state = run_loop.tick(moving_shaft_state)

          dropoff_instruction = Instructions::Dropoff.new(ground_floor)
          first_floor_shaft_state.instructions << dropoff_instruction

          moving_shaft_state = run_loop.tick(first_floor_shaft_state)
          final_shaft_state = run_loop.tick(moving_shaft_state)

          expected_final_elevator = Elevator.new(current_floor: ground_floor)
          expect(final_shaft_state).to eq ShaftState.new(floors, expected_final_elevator, [])
        end
      end
    end
  end
end
