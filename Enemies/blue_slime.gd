extends CharacterBody2D

@export var Speed = 20
@export var limit = 0.5
@export var endPoint: Marker2D
@onready var animatedSprite2d = $AnimatedSprite2D
var startPosition
var endPosition

func _ready():
	startPosition = position
	endPosition = endPoint.global_position

func changeDirection():
	var tempEnd = endPosition
	endPosition = startPosition
	startPosition = tempEnd

func updateVelocity():
	var moveDirection = (endPosition - position)
	if moveDirection.length() < limit:
		position = endPosition
		changeDirection()
	velocity = moveDirection.normalized()*Speed

func updateAnimation():
	var animatedSprite2dString = "walk north"
	if velocity.y > 0:
		animatedSprite2dString = "walk south"
	if velocity.x > 0:
		animatedSprite2dString = "walk east"
	elif velocity.x < 0:
		animatedSprite2dString = "walk west"
	animatedSprite2d.play(animatedSprite2dString)

func _physics_process(delta):
	updateVelocity()
	move_and_slide()
	updateAnimation()
