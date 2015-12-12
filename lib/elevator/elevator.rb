module Elevator
  Elevator = Struct.new(:current_floor, :motion) do
    def initialize(current_floor:, motion: :stopped)
      self.current_floor = current_floor
      self.motion = motion
    end

    def stopped?
      motion == :stopped
    end
  end
end
