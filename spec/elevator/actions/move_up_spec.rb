require 'spec_helper'

module Elevator
  module Actions
    RSpec.describe MoveUp do
      describe "#apply" do
        context "when there is space to move up" do
          it "raises the elevator by one floor in the shaft" do
            ground_floor = Floor.new("G")
            first_floor = Floor.new("1")

            elevator = Elevator.new(current_floor: ground_floor)

            shaft_state = ShaftState.new([ground_floor, first_floor], elevator, [])

            MoveUp.new.apply(shaft_state)

            expect(shaft_state.elevator.current_floor).to eq first_floor
            expect(shaft_state.elevator.motion).to eq :up
          end
        end

        context "when there is no space to move up" do
          it "stays in the same place" do
            ground_floor = Floor.new("G")

            elevator = Elevator.new(current_floor: ground_floor)

            shaft_state = ShaftState.new([ground_floor], elevator, [])

            MoveUp.new.apply(shaft_state)

            expect(shaft_state.elevator.current_floor).to eq ground_floor
          end
        end
      end
    end
  end
end
