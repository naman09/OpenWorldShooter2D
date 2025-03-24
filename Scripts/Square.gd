extends Polygon2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
@export var rotation_speed = 1.0


# Called when the node enters the scene tree for the first time.
func _ready():
	print("inside node:", self.name, self.position)
	self.position += Vector2(200, 200)
	



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
#	pass
#	print(self.transform.origin)
#	self.transform = self.transform.rotated(PI/400)
#	self.position = self.position + Vector2(10, 10)*delta
	rotation += rotation_speed * delta
