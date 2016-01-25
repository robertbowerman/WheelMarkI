include </Users/relativity2.scad>;

stockSupport();

module stockSupport(){

rodDiameter = 6.30;
tenByThreeHeight = 2.93;
tenByThreeWidth = 10.11;
twelveByTwelveSide = 12.17;
    
    adjustmentForPrintSlop = 0.3;

holeForRodDiameter = 6.60 + adjustmentForPrintSlop; 
holeForSmallBarHeight = 3.23 + adjustmentForPrintSlop; 
holeForSmallBarWidth = 10.41 + adjustmentForPrintSlop;
holeForBigBar = 12.47 + adjustmentForPrintSlop;
interCentresGap = 16.0;

//Feature : base that is held to table with G clamps or by a weight
rod(d=30, h=7, anchor=[0,0,0])
align([1,0,0])                      
translate([-15,0,0]) box([114,30,7], anchor=[-1,0,0])
align([1,0,0])
translate([-15,0,0]) rod(d=30, h=7, anchor=[-1,0,0]);

translate([17,0,0])difference(){
translate([-5,0,9])box([90,25,23], anchor=[-1,0,0], $class="body"); // the main body of the item 

translate([0,0,5])
union(){
translated(interCentresGap*x, [0,1])
box([holeForBigBar, 35, holeForBigBar], anchor=[-1,0,-1]); // that is the 12 x 12 holes times two
    
translate([(interCentresGap*2),0,holeForBigBar-holeForSmallBarHeight])
translated((interCentresGap-2)*x, [0,1])
box([holeForSmallBarWidth, 35, holeForSmallBarHeight], anchor=[-1,0,-1]); // that is the two 10 x 3 holes
    
translate([interCentresGap*4-4+(holeForBigBar-holeForRodDiameter)/2,-35/2,holeForBigBar-holeForRodDiameter/2])
rotate(270, [1,0,0])
rod([holeForRodDiameter, holeForRodDiameter, 35], anchor=[0,0,-1], $fn=100); // the roound hole
    
translate([interCentresGap*5-10, 0, holeForBigBar-holeForSmallBarHeight])
box([holeForSmallBarWidth, 35, holeForSmallBarHeight], anchor=[-1,0,-1]);
}}
} // end module

/*
translated(interCentresGap*x, [0,1])
box(size=[holeForBigBar, 35, holeForBigBar], anchor=[-1,0,-1]) // to fix 12mm in
// anchor has -1 for z to get it above the xy plain. We march it down X axis
align([1,0,0])
translated(interCentresGap*x)
box(size=[holeForSmallBarWidth, 35, holeForSmallBarHeight], anchor=[-1,0,-1]); // to fix 12mm in
*/