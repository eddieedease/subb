extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var speed = 250
var velocity = Vector2()
var screensize = Vector2(1500, 800)



# Getting the input
func get_input():
	velocity = Vector2()
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1;
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1;
	if velocity.length() > 0:
		print(velocity)
		velocity = velocity * speed

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	get_input()
	position += velocity * delta
	position.x = clamp(position.x, 0 , screensize.x)
	position.y = clamp (position.y, 0 , screensize.y)
	
	if velocity.length() > 0:
		$anim.play("Walk")
		$Sprite.flip_h = velocity.x < 0
	else:
		$anim.play("Idle")
	pass
