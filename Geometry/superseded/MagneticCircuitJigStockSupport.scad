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

holeForRodDiameter = 6.30; 
holeForSmallBarHeight = 3.23; 
holeForSmallBarWidth =10.41;
holeForBigBar = 12.47;
interCentresGap = 18.0;

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
rod(d=30, h=7, anchor=[0,0,0])
align([1,0,0])                       // why does 0.8 work?
translate([-15,0,0]) box([114,30,7], anchor=[-1,0,0])
align([1,0,0])
translate([-15,0,0]) rod(d=30, h=7, anchor=[-1,0,0]);

//Feature : make holes to put the rods through to hold them steady
differed("hole") 
  translate([(114-90)/2,0,7])box([90,25,18], anchor=[-1,0,0], $class="body")
  union(){
  box(size=[holeForSmallBarWidth,holeForSmallBarHeight,35], anchor=[1,-1,-1]) ; // creates hole for 120mm piece, which is 3 x 10
translate([-(interCentresGap - holeForSmallBarWidth/2 - holeForRodDiameter/2),0,0]) rod(size=[holeForRodDiameter,holeForRodDiameter,35], anchor=[1,-1,-1]); // creates end stop for 99mm piece, where 120-99=21 and 21+12=33
translate([-(interCentresGap - holeForRodDiameter/2 - holeForSmallBarWidth/2),0,0])box(size=[holeForSmallBarWidth,holeForSmallBarHeight,35], anchor=[1,-1,-1], $class="hole")
translate([-(interCentresGap - holeForSmallBarWidth/2 - holeForSmallBarWidth/2),0,0])box(size=[holeForSmallBarWidth,holeForSmallBarHeight,35], anchor=[1,-1,-1], $class="hole")
align([-1,-1,-1])
translate([-(interCentresGap - holeForSmallBarWidth/2 - holeForBigBar/2),0,0])box(size=[holeForBigBar,holeForBigBar,35], anchor=[1,-1,-1], $class="hole")
align([-1,-1,-1])
translate([-(interCentresGap - holeForBigBar/2 - holeForBigBar/2),0,0])box(size=[holeForBigBar,holeForBigBar,35], anchor=[1,-1,-1], $class="hole");
  }
  
  
  /*
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
  */


