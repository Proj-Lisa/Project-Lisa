extends Area2D

@onready var vaulter = %Mona
@onready var pathFollow = $Path2D/PathFollow2D

var canVault = false
var isVaulting = false
var isFacingLeft = false
var pathSpeed = 0.1

func _ready() -> void:
	#flips the ones named Left, so that changes affect both types; place origin on corners
	if "Left" in name:
		scale.x = -1
		isFacingLeft = true

func _process(_delta: float) -> void:
	#activates vault
	if canVault and Input.is_action_pressed("dash"):
		print("Vaulted!")
		isVaulting = true
		
	#stops the vault
	if pathFollow.progress_ratio >= 1:
		isVaulting = false
		pathFollow.progress_ratio = 0
	
	#applies the path, based on the pixels of the path
	if isVaulting:
		pathFollow.progress_ratio += pathSpeed
		vaulter.velocity.y += pathFollow.progress * -1 #to go up
		if isFacingLeft:
			vaulter.velocity.x += pathFollow.progress * -1
		else:
			vaulter.velocity.x += pathFollow.progress
		vaulter.monaSprite.play("H-Vault")

func _on_body_entered(body: Node2D) -> void: #upon entering vault area, can follow path
	#print("vault area")
	
	if "Mona" in body.name:
		vaulter = body
		if vaulter.velocity.y < 0: #can only vault if goingUp
			canVault = true

func _on_body_exited(body: Node2D) -> void:
	if "Mona" in body.name:
		canVault = false
	isVaulting = false			#upon leaving area, no more affect on Player
