module Elevator
  module Instructions
    Pickup = Struct.new(:floor, :direction) do
      include ElevatorMovementInstruction

      def matches_direction?(shaft_direction)
        shaft_direction == direction
      end

      def to_s
        "Pickup (going #{direction}) on level #{floor.name}"
      end
    end
  end
end
