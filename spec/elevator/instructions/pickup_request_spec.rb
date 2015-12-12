require 'spec_helper'

module Elevator
  module Instructions
    RSpec.describe PickupRequest do
      describe "#next_step" do
        context "with a moving elevator on the same level" do
          it "returns a stop action" do
            floor = Floor.new("G")
            elevator = Elevator.new(current_floor: floor)
            shaft_state = ShaftState.new([floor], elevator, [])

            instruction = PickupRequest.new(floor, :up)
            action = instruction.next_step(shaft_state)
            expect(action).to be_a Actions::StopAction
          end
        end

        context "with a moving elevator on a level below the target level" do
          it "returns a MoveUp action" do
            ground_floor = Floor.new("G")
            first_floor = Floor.new("1")
            elevator = Elevator.new(current_floor: ground_floor)
            shaft_state = ShaftState.new([ground_floor, first_floor], elevator, [])

            instruction = PickupRequest.new(first_floor, :down)
            action = instruction.next_step(shaft_state)
            expect(action).to be_a Actions::MoveUp
          end
        end

        context "with a moving elevator on a level above the target level" do
          it "returns a MoveDown action" do
            ground_floor = Floor.new("G")
            first_floor = Floor.new("1")
            elevator = Elevator.new(current_floor: first_floor)
            shaft_state = ShaftState.new([ground_floor, first_floor], elevator, [])

            instruction = PickupRequest.new(ground_floor, :up)
            action = instruction.next_step(shaft_state)
            expect(action).to be_a Actions::MoveDown
          end
        end
      end

      describe "#is_fulfilled?" do
        context "when the elevator is below the target level" do
          it "returns false" do
            ground_floor = Floor.new("G")
            first_floor = Floor.new("1")

            elevator = Elevator.new(current_floor: ground_floor)

            shaft_state = ShaftState.new([ground_floor, first_floor], elevator, [])

            expect(PickupRequest.new(first_floor, :down).is_fulfilled?(shaft_state)).to be_falsy
          end
        end

        context "when the elevator is on the target level" do
          it "returns true" do
            first_floor = Floor.new("1")

            elevator = Elevator.new(current_floor: first_floor)

            shaft_state = ShaftState.new([first_floor], elevator, [])

            expect(PickupRequest.new(first_floor, :down).is_fulfilled?(shaft_state)).to be_truthy
          end
        end

        context "when the elevator is above the target level" do
          it "returns false" do
            ground_floor = Floor.new("G")
            first_floor = Floor.new("1")

            elevator = Elevator.new(current_floor: first_floor)

            shaft_state = ShaftState.new([ground_floor, first_floor], elevator, [])

            expect(PickupRequest.new(ground_floor, :down).is_fulfilled?(shaft_state)).to be_falsy
          end
        end
      end
    end
  end
end
