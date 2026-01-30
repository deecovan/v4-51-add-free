extends Timer

var energy = 1.0
var step = 0.01
var speed = 0.05
var sky: WorldEnvironment
var phase = -1

func _ready() -> void:
	sky = get_parent()
	wait_time = speed
	autostart = true
	start()
	sky.environment.adjustment_brightness = 1
	sky.environment.background_energy_multiplier = 1
	sky.environment.background_intensity = 32000

func _on_timeout() -> void:
	$"../DirectionalLight3D".rotate_x(step)
	sky.environment.adjustment_brightness += phase * step
	sky.environment.background_energy_multiplier += phase * step
	sky.environment.background_intensity += phase * step * 32000
	if (sky.environment.adjustment_brightness <= step
		or sky.environment.adjustment_brightness >= 1.0):
		phase = -phase
	
