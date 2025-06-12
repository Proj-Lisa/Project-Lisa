extends Area2D

@onready var mainSprite = $MainSprite
@onready var vfxSprite = $GlowVFX
@onready var orbCollision = $CollisionShape2D
@onready var gManager = %"Game Manager" #if this doesnt work, need to change Player references (%)

var PickedUp = false
var RespawnTimer = 0
const Time2Respawn = 100

#for tracking objective progress
var maxObjectiveCount = 0
var currentObjectiveCount = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	gManager.max1Count += 1 #each collectible instance updates the number of this macguffin in the scene

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_body_entered(body: Node2D) -> void: #upon entering the sprite, pick it up and remove it
	gManager.addMacGuff1() #update Game Manager score tracker
	queue_free() #removes from Scene
