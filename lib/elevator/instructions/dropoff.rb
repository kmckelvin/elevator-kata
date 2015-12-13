module Elevator
  module Instructions
    Dropoff = Struct.new(:floor) do
      include ElevatorMovementInstruction

      def matches_direction?(shaft_direction)
        true
      end

      def to_s
        "Dropoff on level #{floor.name}"
      end
    end
  end
end
