require 'spec_helper'

module Elevator
  RSpec.describe ShaftState do
    describe "#stopped?" do
      context "when direction is nil" do
        it "returns true" do
          expect(ShaftState.new).to be_stopped
        end
      end

      context "when direction is :stopped" do
        it "returns true" do
          state = ShaftState.new
          state.direction = :stopped
          expect(state).to be_stopped
        end
      end

      context "when direction is :up" do
        it "returns false" do
          state = ShaftState.new
          state.direction = :up
          expect(state).not_to be_stopped
        end
      end
    end
  end
end
