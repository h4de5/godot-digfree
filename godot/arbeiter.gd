extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var GRAVITY = Vector2(0,-9.876)
var GRAVITY_FACTOR = 1.1
var slow_down_factor = 1
var velocity = Vector2(0,0)
var movement_speed_power = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func _physics_process(delta):

	var _left_stick = Input.get_axis("ui_left", "ui_right")

	velocity += GRAVITY * GRAVITY_FACTOR * slow_down_factor
	velocity.x = _left_stick * movement_speed_power * slow_down_factor
	velocity = move_and_slide(velocity, Vector2.UP, false, 4, 0.785398, false)


	for i in range(get_slide_count()):
		var coll = get_slide_collision(i)
