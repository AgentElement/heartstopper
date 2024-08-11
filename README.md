# Heartstopper: A reproducible 36-key keyboard.
---

**This project is still in heavy development, and no functioning prototypes exist 
yet.**

---

Like with most 36-key boards, the main goal of this board is to minimize finger
movement beyond the home row. A secondary goal is to minimize pinky strain.
This is achieved by a small splay on the pinky finger column. 

This board uses the Adafruit KB2040, a low-cost promicro compatible MCU with
the RP2040 chip. It is wired-only, and the hardware is kept simple. The first
prototype is expected to use the I2C pins on the STEMMA QT connector on the
KB2040, so no external TRRS connector will be required. Additionally, we expect
to use clique pinning (Also known as a round-robin or charlieplexed layout) to
build a matrix that requires as few GPIO pins as possible.

Only 1u keycaps are required for the build, but you may substitute a 1.5u
keycap for the the central thumb key.

The physical design is expected to be a 3-layer sandwich: A simple top plate 
to hold the keys, a hotswappable PCB in between, and a robust bottom plate
with small magnets to join the two halves for ease of travel.

All 3-D printed parts are designed with OpenSCAD. The layout is designed 
with Ergogen. Currently, you can find a prototype top plate in the `scad/`
directory

This keyboard is expected to be fully reproducible. You should be able to
modify this keyboard by just changing the ergogen config. Additionally,
assuming that nixpkgs lasts a while, there should be no expiration date on this
project if it goes unmaintained.

The name of this keyboard comes from the shape of the top plate: It looks like
half a heart!

---

![Prototype with top plate only](https://github.com/agentelement/heartstopper/blob/master/img/proto.jpg)
![Top plate with and without switches](https://github.com/agentelement/heartstopper/blob/master/img/top_plate.jpg)

---

Thanks and references

* https://github.com/nxtk/ergogen-template
* https://github.com/ergogen/ergogen
* https://github.com/nix-community/poetry2nix/

