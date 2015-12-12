module Elevator
  module Instructions
    Dropoff = Struct.new(:floor) do
      include ElevatorMovementInstruction
    end
  end
end
