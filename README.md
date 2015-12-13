# Elevator Simulator kata

An elevator simulator, done as a coding exercise emphasising TDD and Object Oriented design principles.

### Running the simulation

```
bin/simulate
```

The `simulate` script has some preset instructions that get added at each pause and exercise the
elevator control code.

![Simulation](https://dl.dropboxusercontent.com/u/12005105/elevator-sim.gif)

### Running the tests

- Clone the repository
- Run `bundle` to install RSpec and Simplecov
- Run `bundle exec rspec`
- Optionally... Browse the test coverage results by opening `coverage/index.html` after running the tests.

### About

The simulation runs a run loop where each tick creates a new `ShaftState` object.
Each successive tick creates a new object and leaves past state objects intact (immutability has advantages).

The `RunLoop` and `InstructionResolver` resolve which instruction to take action on next based on the direction of
movement of the elevator and distance to the target floor. In the case of a pickup request is also factors in the
requested direction of travel after the pickup.
