extends Node

@export var mob_scene: PackedScene

var score
#var running_mob
#var speed = 0.1
# Called when the node enters the scene tree for the first time.
func _ready():
	new_game()
#	running_mob = mob_scene.instantiate()
#	var mob_poly = running_mob.get_node("Polygon2D")
#	print(mob_poly.color)
	
#	mob_poly.color = Color(0,0,0)
#	running_mob.get_child().color = Color(0,0,0)
#	add_child(running_mob)
#	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
#	var mob_spawn_location: PathFollow2D = $MobPath/MobSpawnLocation
#	mob_spawn_location.progress_ratio += speed*delta
#	+ Vector2(100, 0).rotated(mob_spawn_location.rotation + PI/2)
#	running_mob.position = mob_spawn_location.global_position
	
#	var direction = mob_spawn_location.rotation + PI / 2
#	print(direction)
#	Transform2D


func game_over():
	$MobTimer.stop()
	
func new_game():
	score = 0
	$MobTimer.start()


func _on_MobTimer_timeout():
	var mob = mob_scene.instantiate()
	var mob_spawn_location: PathFollow2D = get_node("MobPath/MobSpawnLocation")
	mob_spawn_location.progress_ratio = randf()

	var direction = mob_spawn_location.rotation + PI / 2

	mob.position = mob_spawn_location.global_position

	direction += randf_range(-PI / 4, PI / 4)
	mob.rotation = direction

	var velocity = Vector2(randf_range(150.0, 250.0), 0.0)
	mob.linear_velocity = velocity.rotated(direction)

	add_child(mob)
	
