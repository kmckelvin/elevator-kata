module Elevator
  module Instructions
    Pickup = Struct.new(:floor, :direction) do
      include ElevatorMovementInstruction
    end
  end
end
