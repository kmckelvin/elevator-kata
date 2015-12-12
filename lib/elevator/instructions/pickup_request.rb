module Elevator
  module Instructions
    PickupRequest = Struct.new(:floor, :direction) do
      include ElevatorMovementInstruction
    end
  end
end
