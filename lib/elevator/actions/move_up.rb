module Elevator
  module Actions
    class MoveUp < AbstractMove
      private
      def target_floor(shaft_state)
        shaft_state.floor_navigator.floor_above(shaft_state.elevator.current_floor)
      end

      def target_direction
        :up
      end
    end
  end
end
