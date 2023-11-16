extends CharacterBody2D
@export var speed: float = 300.0
@export var maxHP: int = 3
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var HP: int = maxHP
func handleInput():
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = direction * speed
func updateAnimation():
	if velocity.x < 0: animated_sprite_2d.play("walk west")
	elif velocity.x > 0: animated_sprite_2d.play("walk east")
	elif velocity.y > 0: animated_sprite_2d.play("walk south")
	elif velocity.y < 0: animated_sprite_2d.play("walk north")
	else: animated_sprite_2d.stop()
func handleCollision():
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		var collider = collision.get_collider()
func _physics_process(delta):
	handleInput()
	move_and_slide()
	handleCollision()
	updateAnimation()

func _on_area_2d_body_entered(body):
	HP -= 1
	if HP <= 0:
		HP = maxHP
