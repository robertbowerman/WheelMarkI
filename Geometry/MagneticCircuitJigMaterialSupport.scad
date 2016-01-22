//include </Users/Robert/GitHub/WheelMarkI/Geometry/relativity2.scad>;
//include </Users/RobertBowerman/GitHub/WheelMarkI/Geometry/relativity2.scad>;
include </Users/relativity2.scad>;

holeForRodDiameter = 6.30; 
holeForSmallBarHeight = 3.23; 
holeForSmallBarWidth =10.41;
holeForBigBar = 12.47;
interCentresGap = 18.0;

box(size=[holeForSmallBarWidth,holeForSmallBarHeight,35], anchor=[1,-1,-1])  // creates hole for 120mm piece, which is 3 x 10
align([-1,-1,-1])
translate([-(interCentresGap - holeForSmallBarWidth/2 - holeForRodDiameter/2),0,0]) rod(size=[holeForRodDiameter,holeForRodDiameter,35], anchor=[1,-1,-1]) // creates end stop for 99mm piece, where 120-99=21 and 21+12=33
align([-1,-1,-1])
translate([-(interCentresGap - holeForRodDiameter/2 - holeForSmallBarWidth/2),0,0])box(size=[holeForSmallBarWidth,holeForSmallBarHeight,35], anchor=[1,-1,-1])
align([-1,-1,-1])
translate([-(interCentresGap - holeForSmallBarWidth/2 - holeForSmallBarWidth/2),0,0])box(size=[holeForSmallBarWidth,holeForSmallBarHeight,35], anchor=[1,-1,-1])
align([-1,-1,-1])

translate([-(interCentresGap - holeForSmallBarWidth/2 - holeForBigBar/2),0,0])box(size=[holeForBigBar,holeForBigBar,35], anchor=[1,-1,-1])
align([-1,-1,-1])
translate([-(interCentresGap - holeForBigBar/2 - holeForBigBar/2),0,0])box(size=[holeForBigBar,holeForBigBar,35], anchor=[1,-1,-1]);

