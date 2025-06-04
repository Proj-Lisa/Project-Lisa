extends Area2D

@onready var timer: Timer = $Timer

const BOUCE_VELOCITY = -800.0
const SLOMO = 0.3

func _on_body_entered(body: Node2D) -> void:
	Engine.time_scale = SLOMO
	# body.get_node("CollisionShape2D").queue_free() #Mona passes through objects
	# unless we restart the scene we need to add it back (not during the Bounce: will break game hard)
	timer.start()

func _on_timer_timeout() -> void:
	print("Bounce Back")
	# get_tree().reload_current_scene() <--restarts level
	# could use similar logic to load a new level at the end / ?transition cutscenes
	
	Engine.time_scale = 1 #revert to normal game speed
	%Mona.velocity.y += BOUCE_VELOCITY
