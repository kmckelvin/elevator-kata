module Elevator
  ShaftState = Struct.new(:floors, :elevator, :instructions, :direction) do
    def floor_navigator
      FloorNavigator.new(floors)
    end
  end
end
