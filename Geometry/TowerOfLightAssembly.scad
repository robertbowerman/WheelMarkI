/*

*/
include </Users/relativity2.scad>;
use <Klima_Protekta_Traction_Sensor_PhotoSensor.scad>;
use <Klima_Protekta_Traction_Photosource_LED.scad>;

function offset() = photosensor_hat_rim_diameter()  + 1.0;


translate([offset(),0,0])
translated(offset()*x, [0:9]) {
    photosensor();
    color("black")
    translated([0,0,photosensor_body_height()])
    box([5.0, 0.6, 5], anchor = [0,0,-1]);
}

translate([0,0,-photosource_dome_radius()])
translated(offset()*x, [0,11])
translated(offset()*y, [-2:2])photosource();

/*
color("black")
translated([0,0,photosensor_body_height()])
box([5.0, 0.6, 2], anchor = [0,0,-1]);
*/