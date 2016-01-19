/* This file is WheelMarkI/Geometry/MagneticCircuitJigStockSupport.scad>;   */


include </Users/Robertbowerman/GitHub/WheelMarkI/Geometry/relativity2.scad>;
include </Users/Robert/GitHub/WheelMarkI/Geometry/relativity2.scad>;

//Supports cross sections

// hole 10.41mm wide x 3.23mm wide is roughly 120 (120 only affects sequence)
// hole 6.60mm diameter is roughly 100
// hole 10.41mm wide x 3.23mm wide is roughly 14
// hole 10.41mm wide x 3.23mm wide is roughly 14mm
// hole 12.47mm square is 12mm 
// hole 12.47mm square is 12mm 
rodDiameter = 6.60;
tenByThreeHeight = 3.23;
tenByThreeWidth = 10.41;
twelveByTwelveSide = 12.47;

/*
box(size=[tenByThreeWidth, 35, tenByThreeHeight], anchor=[1,-1,-1]) 
align([-1,-1,-1])
rotate([1,0,0])rod(size=[rodDiameter, rodDiameter, 35], anchor=[1,-1,-1])
align([-1,-1,-1])
box(size=[tenByThreeWidth, 35, tenByThreeHeight], anchor=[1,-1,-1]) 
align([-1,-1,-1])
box(size=[tenByThreeWidth, 35, tenByThreeHeight], anchor=[1,-1,-1]) 
align([-1,-1,-1])
box(size=[twelveByTwelveSide,35,twelveByTwelveSide], anchor=[1,-1,-1])
align([-1,-1,-1])
box(size=[twelveByTwelveSide,35,twelveByTwelveSide], anchor=[1,-1,-1]);
*/

//Feature : base that is held to table with G clamps or by a weight
rod(d=30, h=7, anchor=[-1,0,0])
align([0.8,0,0])                       // why does 0.8 work?
box([114,30,7]) //, anchor=[-1,0,0])
align([0.8,0,0])
rod(d=30, h=7); //, anchor=[-1,0,0]);

//Feature : make holes to put the rods through to hold them steady
differed("hole") 
  translate([15+(114-96)/2,0,7])box([96,25,18], anchor=[-1,0,0])
  translate([36,0,-7])box(size=[tenByThreeWidth, 35, tenByThreeHeight], anchor=[1,-1,-1], $class="hole") 
  align([-1,-1,-1])
  rotate([1,0,0])rod(size=[rodDiameter, rodDiameter, 35], anchor=[1,-1,-1], $class="hole")
  align([-1,-1,-1])
  box(size=[tenByThreeWidth, 35, tenByThreeHeight], anchor=[1,-1,-1], $class="hole") 
  align([-1,-1,-1])
  box(size=[tenByThreeWidth, 35, tenByThreeHeight], anchor=[1,-1,-1], $class="hole") 
  align([-1,-1,-1])
  box(size=[twelveByTwelveSide,35,twelveByTwelveSide], anchor=[1,-1,-1], $class="hole")
  align([-1,-1,-1])
  box(size=[twelveByTwelveSide,35,twelveByTwelveSide], anchor=[1,-1,-1], $class="hole");
  


