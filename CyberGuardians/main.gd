extends Node

@export var villain_scene: PackedScene
var score

func game_over():
	$VillainTimer.stop()
	#$HUD.show_game_over()


func new_game():
	get_tree().call_group(&"villains", &"queue_free")
	#score = 0
	$Player.start($StartPosition.position)
	$StartTimer.start()
	#$HUD.update_score(score)
	$HUD.show_message("Get Ready")


func _on_Villain_Timer_timeout():
	# Create a new instance of the Mob scene.
	var villain = villain_scene.instantiate()

	# Choose a random location on Path2D.
	var villain_spawn_location = get_node(^"VillainPath/VillainSpawnLocation")
	villain_spawn_location.progress = randi()

	# Set the mob's direction perpendicular to the path direction.
	var direction = villain_spawn_location.rotation + PI / 2

	# Set the mob's position to a random location.
	villain.position = villain_spawn_location.position

	# Add some randomness to the direction.
	direction += randf_range(-PI / 4, PI / 4)
	villain.rotation = direction

	# Choose the velocity for the mob.
	var velocity = Vector2(randf_range(150.0, 250.0), 0.0)
	villain.linear_velocity = velocity.rotated(direction)

	# Spawn the mob by adding it to the Main scene.
	add_child(villain)


func _on_StartTimer_timeout():
	$MobTimer.start()
	$ScoreTimer.start()

func _on_player_hit():
	pass # Replace with function body.


func _on_villain_timer_timeout():
	pass # Replace with function body.


func _on_start_timer_timeout():
	pass # Replace with function body.
	
func _ready():
	new_game()
