require 'spec_helper'

module Elevator
  module Instructions
    RSpec.describe Stop do
      describe "#next_step" do
        it "returns a StopAction" do
          action = Instructions::Stop.new.next_step
          expect(action).to be_an Actions::StopAction
        end
      end
    end
  end
end
