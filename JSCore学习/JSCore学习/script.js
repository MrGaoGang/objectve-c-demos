// Objective-C properties become fields.
point.x;
point.x = 10;
// Objective-C instance methods become functions.
var desc = point.description();
console.log(desc);
// Objective-C initializers can be called with constructor syntax.
var p = new MyPoint(1, 2);
p.description();
// Objective-C class methods become functions on the constructor object.
var q = MyPoint.makePointWithXY(0, 0);
console.log(q.x,q.y);
