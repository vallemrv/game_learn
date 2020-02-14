extends Node2D

onready var player = $Player
onready var timer_game_over = $time_game_over
onready var game_over_transition = $gamer_over_transition


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func _on_Area2D_body_entered(body):
	if body.name == "Player":
		body.destroy()
		timer_game_over.start()
		


func _on_time_game_over_timeout():
	game_over_transition.interpolate_property(self, "modulate", Color(1, 1, 1, 1), Color(1, 1, 1, 0), 0.35,
	Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	game_over_transition.start()
	yield(get_tree().create_timer(.5), "timeout")
	if get_tree().reload_current_scene() != OK:
		print("Cagada.")
