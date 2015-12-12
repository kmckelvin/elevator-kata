module Elevator
  class RunLoop
    def tick(shaft_state)
      next_instruction = InstructionResolver.new.next_instruction(shaft_state)
      next_step = next_instruction.next_step
      next_step.apply(shaft_state)
    end
  end
end
