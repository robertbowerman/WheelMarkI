/* This file is WheelMarkI/Geometry/MagneticCircuitJigBackStop.scad>;   */

include </Users/relativity2.scad>;

box(size=[30,12,12], anchor=[1,-1,-1])  // creates end stop for 121mm piece
align([-1,-1,-1])
box(size=[12,33,12], anchor=[1,-1,-1]) // creates end stop for 100mm piece, where 121-100=21 and 21+12=33
align([-1,-1,-1])
box(size=[6,12,12], anchor=[1,-1,-1])
align([-1,-1,-1])
box(size=[12,119,12], anchor=[1,-1,-1]) // creates end stop for 14mm piece, where 121 -14 = 107 + 12 = 119
align([-1,-1,-1])
box(size=[6,12,12], anchor=[1,-1,-1])
align([-1,-1,-1])
box(size=[12,119,12], anchor=[1,-1,-1]) // creates end stop for 14mm piece, where 121 -14 = 107 + 12 = 119
align([-1,-1,-1])
box(size=[6,12,12], anchor=[1,-1,-1])
align([-1,-1,-1])
box(size=[12,121,12], anchor=[1,-1,-1]) // creates end stop for 12mm piece, where 121 -12 = 109 + 12 = 121
align([-1,-1,-1])
box(size=[6,12,12], anchor=[1,-1,-1])
align([-1,-1,-1])
box(size=[12,121,12], anchor=[1,-1,-1]) // creates end stop for 12mm piece, where 121 -12 = 109 + 12 = 121
align([-1,-1,-1])
box(size=[12,12,12], anchor=[1,-1,-1]);

/*uprights for main body (that holds this backstop are 6mm wide - 0.5 = 5.5mm, with gaps of 12.5mm, with algother 7 of them printed all inparallel.  Also provide cross ways holes for the top bar you can see here.  Also provide holes for the work to fall through.  */