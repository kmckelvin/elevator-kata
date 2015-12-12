module Elevator
  module Instructions
    module ElevatorMovementInstruction
      def next_step(shaft_state)
        current_floor = shaft_state.elevator.current_floor

        if current_floor == floor
          Actions::StopAction.new
        elsif shaft_state.floors.index(current_floor) < shaft_state.floors.index(floor)
          Actions::MoveUp.new
        else
          Actions::MoveDown.new
        end
      end

      def is_fulfilled?(shaft_state)
        shaft_state.elevator.current_floor == floor && shaft_state.elevator.stopped?
      end
    end
  end
end