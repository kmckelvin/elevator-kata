module Elevator
  module Actions
    class StopAction
      def apply(shaft_state)
        shaft_state.elevator.motion = :stopped
        shaft_state
      end
    end
  end
end
