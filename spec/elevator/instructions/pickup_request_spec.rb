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

            instruction = PickupRequest.new(first_floor, :up)
            action = instruction.next_step(shaft_state)
            expect(action).to be_a Actions::MoveUp
          end
        end
      end
    end
  end
end
