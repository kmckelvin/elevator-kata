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

      def absolute_distance(shaft_state)
        directional_distance(shaft_state).abs
      end

      def above_or_on_current_floor?(shaft_state)
        directional_distance(shaft_state) <= 0
      end

      def below_or_on_current_floor?(shaft_state)
        directional_distance(shaft_state) >= 0
      end

      private
      def directional_distance(shaft_state)
        shaft_state.floor_navigator.directional_distance_between(floor, shaft_state.elevator.current_floor)
      end
    end
  end
end
