extends Node3D

@export var gimbal_offset := Vector3(0.0,1.0,0.0)
## Keyboard controlled Rotation and Zoom
@export var camera_speed = 1.0
@export var zoom = 0.70
@export var zoom_min = 0.70
@export var zoom_max = 2.8
@export var zoom_speed = 0.125
@export var arm_spring_length = 7.0
@export var arm_spring_length_min = 7.0
@export var arm_spring_length_max = 30.0
@export var arm_spring_length_step = 3.5
@export var camera_FOV = 45.0
## @NEW Gimbal follow the car position VIA gimbal length
# Add to camera move farther
@export var tween_follow_speed = 10.0
# Tween larger values to slow down
@export var tween_speed = 3.0
## Mouse controlled Rotation sensivity and direction
@export var mouse_sensivity = 5000
## -1 normal or +1 inversed
@export var mouse_direction = -1
var gimbal_rotation_x: float
var gimbal_rotation_y: float
var gimbal_rotation_z: float
var vehicle_rotation_x: float
var vehicle_rotation_y: float
var vehicle_eyes : Marker3D
## Link objects
var vehicle: VehicleBody3D
var camera: Camera3D
var arm: SpringArm3D

var stop = false
var UI = CanvasItem

func _ready() -> void:
	vehicle = $"../Vehicle"
	UI = vehicle.get_node("UI")
	arm = $GimbalInner
	camera = $GimbalInner/Camera3D
	## Initial position
	global_position = vehicle.global_position
	rotation = Vector3.ZERO
	arm_spring_length = arm.spring_length
	camera.fov = camera_FOV
	## Initial Mouse Gimbal rotation
	gimbal_rotation_x = arm.rotation.x
	gimbal_rotation_y = arm.rotation.y
	gimbal_rotation_z = arm.rotation.z
	## Initial Camera rotation 
	arm.rotation = Vector3(0, 0, 0)

func _input(event):
	if event.is_action_pressed("cam_zoom_in"):
		zoom -= zoom_speed
		arm_spring_length -= arm_spring_length_step
	if event.is_action_pressed("cam_zoom_out"):
		zoom += zoom_speed
		arm_spring_length += arm_spring_length_step
	zoom = clamp(zoom, zoom_min, zoom_max)
	arm_spring_length = clamp(
		arm_spring_length, arm_spring_length_min, arm_spring_length_max)
		
func _process(delta):
	var tween_fov = get_tree().create_tween()
	tween_fov.tween_property(camera, "fov", 
		camera_FOV * zoom, delta * tween_speed)
	position = vehicle.position + gimbal_offset
	## @NEW Gimbal follow the car position VIA gimbal length
	var arm_length_add = tween_follow_speed * (
		vehicle.linear_velocity.length() / vehicle.MAX_SPEED )
	var arm_length_tween = get_tree().create_tween()
	arm_length_tween.tween_property(arm, "spring_length", 
		arm_spring_length + arm_length_add,
		delta * tween_speed)
		
	## Remember Vehicle rotation XY
	vehicle_rotation_x = vehicle.rotation.x
	vehicle_rotation_y = vehicle.rotation.y
	
	## Keyboard Gimbal rotation
	var x = Input.get_axis("ui_up", "ui_down")
	gimbal_rotation_x = gimbal_rotation_x + x * camera_speed * delta
	var y = Input.get_axis("ui_right", "ui_left")
	gimbal_rotation_y = gimbal_rotation_y + y * camera_speed * delta
	## Mouse Gimbal rotation
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_RIGHT):
		var mouse_velocity = Input.get_last_mouse_velocity()
		gimbal_rotation_y = (gimbal_rotation_y +
			mouse_direction * mouse_velocity.x / mouse_sensivity)
		gimbal_rotation_x = (gimbal_rotation_x +
		 	mouse_direction * mouse_velocity.y / mouse_sensivity)
			
	## Remember Gimbal rotation
	var new_rotation = Vector3(
		gimbal_rotation_x - vehicle_rotation_x,
			gimbal_rotation_y + vehicle_rotation_y, 
			gimbal_rotation_z)

	## @GOOD Fix Camera rotation jump when when y=360+n
	var current_rotation_y = arm.rotation.y
	var target_rotation_y = new_rotation.y
	var r_delta_y = target_rotation_y - current_rotation_y
	var s_delta_y = wrapf(r_delta_y, -PI, PI)
	var tween_rotation = get_tree().create_tween()
	tween_rotation.tween_property(
		arm, "rotation", 
		Vector3(new_rotation.x, 
			current_rotation_y + s_delta_y, 
			new_rotation.z), 
		delta * tween_speed)
