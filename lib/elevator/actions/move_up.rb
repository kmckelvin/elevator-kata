module Elevator
  module Actions
    class MoveUp < AbstractMove
      private
      def target_floor(shaft_state)
        next_floor_index = shaft_state.floors.index(shaft_state.elevator.current_floor) + 1
        shaft_state.floors[next_floor_index]
      end
    end
  end
end
