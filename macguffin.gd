extends Area2D

@onready var mainSprite = $MainSprite
@onready var vfxSprite = $GlowVFX
@onready var orbCollision = $CollisionShape2D

var PickedUp = false
var RespawnTimer = 0
const Time2Respawn = 100

#for tracking objective progress
var maxObjectiveCount = 0
var currentObjectiveCount = 0
var remainingObjectiveCount = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	maxObjectiveCount += 1 #update and state to player the number of this objective in the scene
	print("Collect ",maxObjectiveCount," macguffins!")
	
	remainingObjectiveCount = maxObjectiveCount
	
	#add similar for total orbs? at least backend tracking maybe


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# if picked up, countdown the time to respawn
	if PickedUp == true:
		RespawnTimer += 1
	
	#once time is up, respawn and reset timer
	if RespawnTimer == Time2Respawn:
		PickedUp = false
		RespawnTimer = 0
		mainSprite.show()
		vfxSprite.show()
		orbCollision.set_deferred("disabled", false)
		#queue_redraw() #doesnt work returning it to the Scene

func _on_body_entered(body: Node2D) -> void: #upon entering the orb, pick it up and remove it
	update_ObjectiveCounts()
	
	#remove orb
	PickedUp = true
	mainSprite.hide()
	vfxSprite.hide()
	orbCollision.set_deferred("disabled", true)
	
	# queue_free() #removes from Scene

#used to update player objective trackers upon pickup
func update_ObjectiveCounts():
	currentObjectiveCount += 1
	remainingObjectiveCount = maxObjectiveCount - currentObjectiveCount
	print("Got ",currentObjectiveCount,"! ",remainingObjectiveCount," macguffins remain!")
	
	#dif message for objective complete; handled in game/mechanix, actually? global variables?
