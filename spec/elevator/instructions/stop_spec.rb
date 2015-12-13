require 'spec_helper'

module Elevator
  module Instructions
    RSpec.describe Stop do
      describe "#next_step" do
        it "returns a StopAction" do
          action = Instructions::Stop.new.next_step(nil)
          expect(action).to be_an Actions::StopAction
        end
      end

      describe "#is_fulfilled?" do
        context "when the elevator is stopped" do
          it "returns true" do
            elevator = Elevator.new(current_floor: nil)
            shaft_state = ShaftState.new([], elevator, [])

            action = Instructions::Stop.new
            expect(action.is_fulfilled?(shaft_state)).to be_truthy
          end
        end

        context "when the elevator is moving" do
          it "returns false" do
            elevator = Elevator.new(current_floor: nil, motion: :down)
            shaft_state = ShaftState.new([], elevator, [])

            action = Instructions::Stop.new
            expect(action.is_fulfilled?(shaft_state)).to be_falsy
          end
        end
      end

      describe "above_or_on_current_floor?" do
        it "returns true" do
          action = Instructions::Stop.new
          expect(action.above_or_on_current_floor?(nil)).to be_truthy
        end
      end

      describe "below_or_on_current_floor?" do
        it "returns true" do
          action = Instructions::Stop.new
          expect(action.below_or_on_current_floor?(nil)).to be_truthy
        end
      end

      describe "matches_direction?" do
        it "returns true" do
          action = Instructions::Stop.new
          expect(action.matches_direction?(nil)).to be_truthy
        end
      end
    end
  end
end
