/* Spokes

Spokes could be i) purely 3D printed nylon, ii) 3D printed nylon with a bolt down the middle ore iii) bicycle spokes purchased commerically made of wire like metal. Option iii) wil attach to the outer metal rim well, but attatching to the 3DP hub is an issue, as is sourcing the right length. 


*/

function bicycleWheelMetalRimInnerDiameter() = 560.0; // This is alsomst exactly 22 inches, where 22" = 558.8mm (it is hard for me to measure my wheel this accurately). 
function bicycleWheelMetalRimOuterDiameter() = 570.0; // 
function bicycleWheelRubberTyreOuterDiameter() = 645.0; //
function bicycleWheelSpokeLength() = 263.0; // on the wheel I have in the hall

// If the rotor outer diameter is 230mm then the spokes need to be 170mm (not realistic)
// If the Rotor is 50mm each side, on a 250mm diamater stator, for a 350mm diameter hub (and thus 175mm radius) then spokes need to be between 90 and 100mm. 