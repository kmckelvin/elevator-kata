module Elevator
  ShaftState = Struct.new(:floors, :elevator, :instructions, :direction) do
    def floor_navigator
      FloorNavigator.new(floors)
    end

    def going_up?
      direction == :up
    end

    def going_down?
      direction == :down
    end

    def stopped?
      direction.nil? || direction == :stopped
    end
  end
end
