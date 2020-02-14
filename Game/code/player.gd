extends KinematicBody2D

export var speed = 250;
export var gravity = 1500;
export var jump_force = 800;

onready var particle = $Particles2D
onready var img = $img

var _velocity = Vector2.ZERO;
var _died = false

func _ready():
	pass # Replace with function body.


func _input(event):
	
	_velocity.x = 0
	if Input.is_action_just_pressed("jump") and is_on_floor():
		_velocity.y -= jump_force
	if Input.is_action_pressed("left"):
		_velocity.x  -= speed
	if Input.is_action_pressed("right"):
		_velocity.x += speed

func _physics_process(delta):
	if not _died:
		_velocity.y += gravity * delta
		_velocity = move_and_slide(_velocity, Vector2.UP)
	
	
func destroy():
	_died = true
	_velocity = Vector2.ZERO
	img.visible = false
	particle.emitting = true
	
