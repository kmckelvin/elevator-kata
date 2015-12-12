module Elevator
  module Actions
    class MoveUp
      def apply(shaft_state)
        next_floor_index = shaft_state.floors.index(shaft_state.elevator.current_floor) + 1
        next_floor = shaft_state.floors[next_floor_index]

        if next_floor
          shaft_state.elevator.current_floor = next_floor
        end
      end
    end
  end
end
