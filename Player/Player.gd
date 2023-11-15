extends CharacterBody2D
@export var speed: float = 300.0
@onready var animated_sprite_2d = $AnimatedSprite2D
func handleInput():
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = direction * speed
func updateAnimation():
	if velocity.x < 0: animated_sprite_2d.play("walk west")
	elif velocity.x > 0: animated_sprite_2d.play("walk east")
	elif velocity.y > 0: animated_sprite_2d.play("walk south")
	elif velocity.y < 0: animated_sprite_2d.play("walk north")
	else: animated_sprite_2d.stop()
func _physics_process(delta):
	handleInput()
	move_and_slide()
	updateAnimation()
