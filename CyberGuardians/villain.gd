extends RigidBody2D


func _ready():
	var villain_types = $AnimatedSprite2D.sprite_frames.get_animation_names()
	$AnimatedSprite2D.play(villain_types[randi() % villain_types.size()])
	
	#$AnimatedSprite2D.animation = mob_types.pick_random()



func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
