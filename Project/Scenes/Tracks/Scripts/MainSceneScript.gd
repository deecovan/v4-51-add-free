extends Node3D

@export var DEBUG = true

var UI: CanvasLayer
var vehicle: VehicleBody3D

func _ready():
	vehicle = $Vehicle
	UI = vehicle.get_node("UI")
	if DEBUG:
		var viewport = get_viewport()
		## Use unshaded for tests
		viewport.debug_draw = viewport.DEBUG_DRAW_UNSHADED
		UI.logs_show()
	else:
		UI.logs_hide()
	UI.show_message("Get Ready!")

func _process(_delta):
	if Input.is_action_just_pressed('restore'):
		UI.show_message("Restoring...")
		vehicle.position = Vector3(
			vehicle.position.x + randf() * 4.0 - 2.0,
			vehicle.position.y + 1.0,
			vehicle.position.z + randf() * 4.0 - 2.0)
		vehicle.rotation = Vector3(0.0,vehicle.rotation.y,0.0)
		vehicle.constant_force = Vector3.ZERO
		vehicle.constant_torque = Vector3.ZERO
		vehicle.linear_velocity = Vector3.ZERO
		vehicle.angular_velocity = Vector3.ZERO
		
func _unhandled_input(event):
	if event is InputEventKey and event.pressed and not event.is_echo():
		use_main_controls(event)

func use_main_controls(_event) -> void:
	if Input.is_action_just_pressed('help'):
		UI.show_message_again()
	if Input.is_action_just_pressed('Show Info'):
		UI.show_info()
	if Input.is_action_just_pressed('Hide Info'):
		UI.hide_info()
## Toggle between debug draw modes using a key press
	if Input.is_action_just_pressed('viewport'):
		var viewport = get_viewport()
		viewport.debug_draw = (viewport.debug_draw + 1) % 2
## Await and reload
	if Input.is_action_just_pressed('reload'):
		await UI.show_message("Reloading...")
		var tracks = get_tree().get_nodes_in_group("Tracks")
		## Fix F6 started single scene
		if tracks.size() > 0:
			tracks[0].queue_free()
		get_tree().call_deferred("reload_current_scene")
## Await and exit
	if Input.is_action_pressed("exit"):
		await UI.show_message("Exiting...")
		get_tree().call_deferred("quit")

## Hide UI
	if Input.is_action_pressed("hide_ui"):
		UI.visible = !UI.visible
