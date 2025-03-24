extends Area2D
signal hit

@export var speed = 400 # (pixels/sec).
var screen_size

func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false


func _ready():
	screen_size = get_viewport_rect().size
	var rec: RectangleShape2D = $CollisionShape2D.shape
	print(rec.size)
	print($CollisionShape2D.shape.size)


func _process(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
#		$Polygon2D.play()
#	else:
#		$Polygon2D.stop()

	position += velocity * delta
	
	var x_extent = $CollisionShape2D.shape.size.x
	var y_extent = $CollisionShape2D.shape.size.y
	
	position.x = clamp(position.x, x_extent, screen_size.x - x_extent)
	position.y = clamp(position.y, y_extent, screen_size.y - y_extent)


func _on_Player_body_entered(_body):
	hide()
	emit_signal("hit")
	
	$CollisionShape2D.set_deferred("disabled", true)
