# Heartstopper: A pretty reproducible 36-key keyboard.

Like with most 36-key boards, the main goal of this board is to minimize finger
movement beyond the home row. A secondary goal is to minimize pinky strain.
This is achieved by a small splay on the pinky finger column.

This board uses the Adafruit KB2040, a low-cost promicro compatible MCU with
the RP2040 chip. It is wired-only, and the hardware is kept simple.
Heartstopper uses the I2C pins on the STEMMA QT connector on the KB2040, so no
external TRRS connector is required. The matrix for the keyboard is clique
pinned (Also known as a round-robin or charlieplexed layout), which is a type
of layout that requires as few GPIO pins as possible. Each half only requires six
GPIO pins: 5 for the matrix plus one pin for an interrupt line.

Only 1u keycaps are required for the build, but you may substitute a 1.5u
keycap for the the central thumb key.

The physical design is a 3-layer sandwich: A PLA top plate
to hold the keys, a hotswappable PCB in between, and a TPU bottom gasket.
The top plate and PCB are seperated by TPU spacers.

All 3-D printed parts are designed with OpenSCAD. The layout is designed with
Ergogen. All parts needed to build this keyboard (top plate, bottom gasket,
spacers) can be found in the `scad/` directory.

The name of this keyboard comes from the shape of the top plate: It looks like
half a heart! And it's heartstoppingly gorgeous!

---
![Heartstopper assembled](https://github.com/AgentElement/heartstopper/blob/master/img/assembled.jpg)

![Heartstopper pcb](https://github.com/AgentElement/heartstopper/blob/master/img/pcb.jpg)

![Heartstopper schematic](https://github.com/AgentElement/heartstopper/blob/master/img/schematic.png)

![Heartstopper reverse left](https://github.com/AgentElement/heartstopper/blob/master/img/board.png)

---

Thanks and references

* https://github.com/nxtk/ergogen-template
* https://github.com/ergogen/ergogen
* https://github.com/nix-community/poetry2nix/

