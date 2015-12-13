require 'spec_helper'

module Elevator
  RSpec.describe InstructionResolver do
    describe "#next_instruction" do
      context "with pending instructions" do
        context "when the shaft is in a stopped state" do
          it "finds the nearest floor" do
            ground_floor = Floor.new("G")
            first_floor = Floor.new("1")
            second_floor = Floor.new("2")
            floors = [ground_floor, first_floor, second_floor]

            elevator = Elevator.new(current_floor: ground_floor)
            expected_instruction = Instructions::Pickup.new(first_floor, :up)
            instructions = [
              Instructions::Pickup.new(second_floor, :down),
              expected_instruction
            ]

            state = ShaftState.new(floors, elevator, instructions)
            resolver = InstructionResolver.new
            expect(resolver.next_instruction(state)).to eq expected_instruction
          end
        end

        context "when the shaft is going up" do
          it "finds the nearest floor instruction above the elevator" do
            ground_floor = Floor.new("G")
            first_floor = Floor.new("1")
            second_floor = Floor.new("2")
            third_floor = Floor.new("3")
            fourth_floor = Floor.new("4")
            floors = [ground_floor, first_floor, second_floor, third_floor, fourth_floor]

            elevator = Elevator.new(current_floor: first_floor)
            expected_instruction = Instructions::Pickup.new(third_floor, :up)
            instructions = [
              Instructions::Pickup.new(ground_floor, :up),
              expected_instruction
            ]

            state = ShaftState.new(floors, elevator, instructions, :up)
            resolver = InstructionResolver.new
            expect(resolver.next_instruction(state)).to eq expected_instruction
          end
        end

        context "when the shaft is going down" do
          it "finds the nearest floor instruction below the elevator" do
            ground_floor = Floor.new("G")
            first_floor = Floor.new("1")
            second_floor = Floor.new("2")
            third_floor = Floor.new("3")
            fourth_floor = Floor.new("4")
            floors = [ground_floor, first_floor, second_floor, third_floor, fourth_floor]

            elevator = Elevator.new(current_floor: third_floor)
            expected_instruction = Instructions::Pickup.new(first_floor, :down)
            instructions = [
              Instructions::Pickup.new(fourth_floor, :down),
              expected_instruction
            ]

            state = ShaftState.new(floors, elevator, instructions, :down)
            resolver = InstructionResolver.new
            expect(resolver.next_instruction(state)).to eq expected_instruction
          end
        end
      end

      context "with no pending instructions" do
        it "returns a stop instruction" do
          state = ShaftState.new(nil, nil, [])
          resolver = InstructionResolver.new

          expect(resolver.next_instruction(state)).to eq Instructions::Stop.new
        end
      end
    end
  end
end
