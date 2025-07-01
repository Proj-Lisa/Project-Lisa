extends Area2D

@onready var leaper = %Mona
@onready var pathFollow = $Path2D/PathFollow2D

var canLeap = false
var isLeaping = false
var isFacingLeft = false
var pathSpeed = 0.15

func _ready() -> void:
	#flips the ones named Left, so that changes affect both types; place origin on corners
	if "Left" in name:
		scale.x = -1
		isFacingLeft = true

func _process(_delta: float) -> void:
	#activates vault
	if canLeap and Input.is_action_pressed("jump"):
		print("Leaped!")
		isLeaping = true
		
	#stops the vault
	if pathFollow.progress_ratio >= 1:
		isLeaping = false
		pathFollow.progress_ratio = 0
	
	#applies the path, based on the pixels of the path
	if isLeaping:
		pathFollow.progress_ratio += pathSpeed
		leaper.velocity.y += pathFollow.progress * -1 #to go up
		
		#no X direction right now. change to apply vectors for rotation purposes?
		#if isFacingLeft:
		#	leaper.velocity.x += pathFollow.progress * -1
		#else:
		#	leaper.velocity.x += pathFollow.progress
		leaper.monaSprite.play("H-Vault")

func _on_body_entered(body: Node2D) -> void: #upon entering vault area, can follow path
	if "Mona" in body.name:
		leaper = body
		if leaper.velocity.y <= 0: #cannot leap if going down
			canLeap = true

func _on_body_exited(body: Node2D) -> void:
	if "Mona" in body.name:
		canLeap = false
	isLeaping = false			#upon leaving area, no more affect on Player
