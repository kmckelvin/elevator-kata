require 'spec_helper'

module Elevator
  module Actions
    RSpec.describe StopAction do
      describe "#apply" do
        it "stops the elevator" do
          floor = Floor.new("G")
          elevator = Elevator.new(current_floor: floor, motion: :up)
          action = StopAction.new
          state = ShaftState.new([floor], elevator, [action])

          new_state = action.apply(state)
          expect(new_state.elevator.motion).to eq :stopped
          expect(new_state.elevator.current_floor).to eq floor
        end
      end
    end
  end
end
