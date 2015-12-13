require 'spec_helper'

module Elevator
  module Instructions
    RSpec.describe Pickup do
      describe "#next_step" do
        context "with a moving elevator on the same level" do
          it "returns a stop action" do
            floor = Floor.new("G")
            elevator = Elevator.new(current_floor: floor)
            shaft_state = ShaftState.new([floor], elevator, [])

            instruction = Pickup.new(floor, :up)
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

            instruction = Pickup.new(first_floor, :down)
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

            instruction = Pickup.new(ground_floor, :up)
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

            expect(Pickup.new(first_floor, :down).is_fulfilled?(shaft_state)).to be_falsy
          end
        end

        context "when the elevator is on the target level" do
          context "and the elevator is stopped" do
            it "returns true" do
              first_floor = Floor.new("1")

              elevator = Elevator.new(current_floor: first_floor)

              shaft_state = ShaftState.new([first_floor], elevator, [])

              expect(Pickup.new(first_floor, :down).is_fulfilled?(shaft_state)).to be_truthy
            end
          end

          context "and the elevator is not stopped" do
            it "returns false" do
              first_floor = Floor.new("1")

              elevator = Elevator.new(current_floor: first_floor, motion: :up)

              shaft_state = ShaftState.new([first_floor], elevator, [])

              expect(Pickup.new(first_floor, :down).is_fulfilled?(shaft_state)).to be_falsy
            end
          end
        end

        context "when the elevator is above the target level" do
          it "returns false" do
            ground_floor = Floor.new("G")
            first_floor = Floor.new("1")

            elevator = Elevator.new(current_floor: first_floor)

            shaft_state = ShaftState.new([ground_floor, first_floor], elevator, [])

            expect(Pickup.new(ground_floor, :down).is_fulfilled?(shaft_state)).to be_falsy
          end
        end
      end

      describe "#matches_direction?" do
        context "when the directions are equal" do
          it "returns true" do
            expect(Pickup.new(nil, :down).matches_direction?(:down)).to be_truthy
          end
        end

        context "when the directions are not equal" do
          it "returns false" do
            expect(Pickup.new(nil, :down).matches_direction?(:up)).to be_falsy
          end
        end
      end

      describe "#to_s" do
        it "returns the string formatted as 'Pickup (going down) on level 8" do
          floor = Floor.new("8")
          pickup = Pickup.new(floor, :down)
          expect(pickup.to_s).to eq "Pickup (going down) on level 8"
        end
      end
    end
  end
end
