extends Node2D

const Speed = 100

var direction = 1

@onready var raycast_right = $RayCastRight
@onready var raycast_left = $RayCastLeft
@onready var animatedSprite = $AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if raycast_right.is_colliding():
			direction = -1
			animatedSprite.flip_h = true
	if raycast_left.is_colliding():
			direction = 1
			animatedSprite.flip_h = false
	
	position.x += direction * Speed * delta
