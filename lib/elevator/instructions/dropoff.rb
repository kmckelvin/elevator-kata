module Elevator
  module Instructions
    Dropoff = Struct.new(:floor) do
      include ElevatorMovementInstruction

      def matches_direction?(shaft_direction)
        true
      end
    end
  end
end
