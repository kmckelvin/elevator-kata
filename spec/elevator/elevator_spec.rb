require 'spec_helper'

module Elevator
  RSpec.describe Elevator do
    it "is initialized in a stopped state" do
      elevator = Elevator.new(current_floor: nil)
      expect(elevator.motion).to eq :stopped
    end
  end
end
