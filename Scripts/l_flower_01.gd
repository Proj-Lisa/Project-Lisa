extends Area2D

@onready var animFlower = $AnimatedSprite2D

var hasBeenEntered = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:	#underscore on _delta is because not intended to be called below
	pass

func _on_body_entered(_body: Node2D) -> void: #upon entering the sprite, change animation
	if not hasBeenEntered:
		animFlower.play("2-Bloom")
		hasBeenEntered = true
