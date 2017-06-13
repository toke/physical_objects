/*
    By Toke 2017-06-13
    Public domain
*/

outer_diam = 10;
inner_diam = 7;
height = 2;
fn = 100;

/*
    Circular spacer
*/
module spacer(height, outer, inner, fn=100) {
    
    // prevent undersizing (inner vs outer polygon)
    // See: https://en.wikibooks.org/wiki/OpenSCAD_User_Manual/undersized_circular_objects
    fudge = 1/cos(180/fn); // circumscribed

    difference() {
        cylinder(height, outer * fudge, outer * fudge, $fn=fn);
        
        translate([0, 0, -0.1])
        cylinder(height + 0.2, inner * fudge, inner * fudge, $fn=fn);
    }
}

spacer(height, outer_diam, inner_diam, fn);