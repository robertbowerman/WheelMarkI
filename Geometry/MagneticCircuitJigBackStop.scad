/* This file is WheelMarkI/Geometry/MagneticCircuitJigBackStop.scad>;   */

include <../relativity2.scad>;
include </Users/Robert/GitHub/WheelMarkI/Geometry/relativity2.scad>;

box(size=[30,12,12], anchor=[1,-1,-1])  // creates end stop for 120mm piece
align([-1,-1,-1])
box(size=[12,33,12], anchor=[1,-1,-1]) // creates end stop for 99mm piece, where 120-99=21 and 21+12=33
align([-1,-1,-1])
box(size=[6,12,12], anchor=[1,-1,-1])
align([-1,-1,-1])
box(size=[12,118,12], anchor=[1,-1,-1])
align([-1,-1,-1])
box(size=[6,12,12], anchor=[1,-1,-1])
align([-1,-1,-1])
box(size=[12,118,12], anchor=[1,-1,-1])
align([-1,-1,-1])
box(size=[6,12,12], anchor=[1,-1,-1])
align([-1,-1,-1])
box(size=[12,120,12], anchor=[1,-1,-1])
align([-1,-1,-1])
box(size=[6,12,12], anchor=[1,-1,-1])
align([-1,-1,-1])
box(size=[12,120,12], anchor=[1,-1,-1])
align([-1,-1,-1])
box(size=[12,12,12], anchor=[1,-1,-1]);
