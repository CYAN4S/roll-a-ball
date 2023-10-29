extends RigidBody3D

@export var force: float
@export var score := 0

@export var score_label: Label
@export var win_label: Label

var total_coin: int

func _ready():
	total_coin = get_tree().get_nodes_in_group("coins").size()


func _process(_delta):
	if Input.is_action_just_pressed("esc"):
		get_tree().reload_current_scene()


func _physics_process(delta: float):
	var direction := Vector3.ZERO
	
	if Input.is_action_pressed("move_right"):
		direction.x += 1
	if Input.is_action_pressed("move_left"):
		direction.x -= 1
	if Input.is_action_pressed("move_back"):
		direction.z += 1
	if Input.is_action_pressed("move_front"):
		direction.z -= 1
	
	if direction != Vector3.ZERO:
		direction = direction.normalized()
	
	apply_force(direction * force * delta)


func increase_point():
	score += 1
	
	if (score >= total_coin):
		win_label.show()


func on_coin_earned():
	increase_point()
	score_label.text = "%s" % score
