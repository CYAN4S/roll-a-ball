extends Area3D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	rotate(Vector3.FORWARD, delta)
	rotate(Vector3.LEFT, delta)


func _on_body_entered(body: Node3D):
	body.on_coin_earned()
	queue_free()
