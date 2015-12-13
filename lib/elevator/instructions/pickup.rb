module Elevator
  module Instructions
    Pickup = Struct.new(:floor, :direction) do
      include ElevatorMovementInstruction

      def matches_direction?(shaft_direction)
        shaft_direction == direction
      end
    end
  end
end
