/* Component - photosource - dimensions go in here to be used in constructive geometry.  Measurements made with digital vernier calipers and are in mm. 

Pin Out to test
Connect one end of resistor to pin 13.   Resistor value can be between 220 ohm and up to 1k ohm.  We use 330 ohm Orange, Orange, Brown, Gold.  
Connect other end of resistor to LED positive ie anode ie long leg
Connect LED negative or cathode to ground ie short leg.  



*/

function photosource_body_height() = 5.00; // excluding dome
function photosource_body_diameter() = 5.00; 
function photosource_hat_rim_height() = 0.80;
function photosource_hat_rim_diameter() = 5.86;
// cut off diameter 5.52
function photosource_wire_long_length() = 28.8; 
function photosource_wire_short_length() = 27.1; 
function photosource_wire_diameter() = 0.50; 
function photosource_wire_offset() = 2.0; 

function hotosource_unit_price() = 2.00; // Pounds Sterling

photosource();

module photosource() {

translate([0,0,photosource_body_height()])
color("blue")sphere(2.5, $fn=500);

color("yellow")cylinder(photosource_body_height(),photosource_body_diameter()/2,photosource_body_diameter()/2, $fn=500);
translate([0,0,-photosource_hat_rim_height])
color("orange")cylinder(photosource_hat_rim_height(),photosource_hat_rim_diameter()/2,photosource_hat_rim_diameter()/2, $fn=500);

translate([-photosource_wire_offset()/2,0,-photosource_wire_long_length()])
cylinder(photosource_wire_long_length(),photosource_wire_diameter()/2,photosource_wire_diameter()/2, $fn=4);
translate([photosource_wire_offset()/2,0,-photosource_wire_short_length()])
cylinder(photosource_wire_short_length(),photosource_wire_diameter()/2,photosource_wire_diameter()/2, $fn=4);
}