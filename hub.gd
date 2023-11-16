extends Node2D

@onready var hearts = $CanvasLayer/hearts
# Called when the node enters the scene tree for the first time.
func _ready():
	hearts.setMaxHearts(20)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
