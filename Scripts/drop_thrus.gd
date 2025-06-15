extends TileMapLayer

@onready var player = $Mona
@onready var orbCollision = $CollisionShape2D
@onready var dropThrus = $"."

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("slide"):
		dropThrus.collision_enabled = false
	if Input.is_action_just_released("slide"):
		dropThrus.collision_enabled = true
