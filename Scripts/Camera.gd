extends Camera3D

@export var player: Node3D

var d: Vector3

# Called when the node enters the scene tree for the first time.
func _ready():
	d = position - player.position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float):
	position = player.position + d
