require 'spec_helper'

module Elevator
  module Actions
    RSpec.describe MoveDown do
      describe "#apply" do
        context "when there is space to move down" do
          it "lowers the elevator by one floor in the shaft" do
            ground_floor = Floor.new("G")
            first_floor = Floor.new("1")

            elevator = Elevator.new(current_floor: first_floor)

            shaft_state = ShaftState.new([ground_floor, first_floor], elevator, [])

            MoveDown.new.apply(shaft_state)

            expect(shaft_state.elevator.current_floor).to eq ground_floor
            expect(shaft_state.elevator.motion).to eq :down
            expect(shaft_state).to be_going_down
          end
        end
      end
    end
  end
end
