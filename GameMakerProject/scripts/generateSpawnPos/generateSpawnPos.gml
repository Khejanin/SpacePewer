// GameMaker Language Preview (Read-Only)

// Declare Temp
var left = 1;

// Declare Temp
var right = 2;

// Declare Temp
var up = 3;

// Declare Temp
var down = 4;

// Choose
var generalPos = choose(left, right, up, down);

// Get Random Number
var xPos = floor(random_range(0, room_width + 1));

// Get Random Number
var yPos = floor(random_range(0, room_height + 1));

// If Expression
if(generalPos==left)
{
	// Create Instance
	var result = instance_create_layer(-256, yPos, "Entities", obj_Point);

	// Return
	return result;
}

// If Expression
if(generalPos==right)
{
	// Create Instance
	var result = instance_create_layer(room_width+256, yPos, "Entities", obj_Point);

	// Return
	return result;
}

// If Expression
if(generalPos==up)
{
	// Create Instance
	var result = instance_create_layer(xPos, -256, "Entities", obj_Point);

	// Return
	return result;
}

// If Expression
if(generalPos==down)
{
	// Create Instance
	var result = instance_create_layer(xPos, room_height+256, "Entities", obj_Point);

	// Return
	return result;
}
