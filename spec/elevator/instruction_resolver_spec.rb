require 'spec_helper'

module Elevator
  RSpec.describe InstructionResolver do
    describe "#next_instruction" do
      context "with pending instructions" do
        it "returns the first instruction" do
          instruction = Instructions::Pickup.new(nil)
          state = ShaftState.new(nil, nil, [instruction])
          resolver = InstructionResolver.new
          expect(resolver.next_instruction(state)).to eq instruction
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
