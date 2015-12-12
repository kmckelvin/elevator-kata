module Elevator
  class InstructionResolver
    def next_instruction(shaft_state)
      shaft_state.instructions[0] || Instructions::Stop.new
    end
  end
end
