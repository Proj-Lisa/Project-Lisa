extends Area2D

@onready var animSprite = $AnimatedSprite2D
@onready var orbCollision = $CollisionShape2D

var PickedUp = false
var RespawnTimer = 0
const TIME_TO_RESPAWN = 100
const SPEED_BOOST = 50

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	
	#replace with add-to-variable that counts Orbs in the Scene, to pull for auto-figuring max Collectables


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	# if picked up, countdown the time to respawn
	if PickedUp == true:
		RespawnTimer += 1
	
	#once time is up, respawn and reset timer
	if RespawnTimer == TIME_TO_RESPAWN:
		PickedUp = false
		RespawnTimer = 0
		animSprite.show()
		orbCollision.set_deferred("disabled", false)
		#queue_redraw() #doesnt work returning it to the Scene

func _on_body_entered(body: Node2D) -> void: #upon entering the orb, pick it up and remove it
	print("got orb")
	
	#apply speed boost, based on direction
	if body.velocity.x > 0:
		body.velocity.x += SPEED_BOOST
	elif body.velocity.x < 0:
		body.velocity.x += SPEED_BOOST * -1
	#if stand on an orb when it respawns, eg velocity == 0, then apply no movement
	
	#remove orb
	PickedUp = true
	animSprite.hide()
	orbCollision.set_deferred("disabled", true)
	
	# queue_free() #removes from Scene
