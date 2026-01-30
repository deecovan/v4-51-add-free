extends Timer

var energy = 1.0
var step = 0.01
var speed = 0.05
var sky: WorldEnvironment
var phase = -1
var p = 1.0
var intensity = 9200

func _ready() -> void:
	sky = get_parent()
	wait_time = speed
	autostart = true
	start()
	sky.environment.adjustment_brightness = p
	sky.environment.background_energy_multiplier = p
	sky.environment.background_intensity = p * intensity

func _on_timeout() -> void:
	p += phase * step
	if sky.environment.adjustment_brightness < step:
		sky.environment.adjustment_brightness = step
	if sky.environment.background_energy_multiplier < step:
		sky.environment.background_energy_multiplier = step
	if sky.environment.background_intensity < 1:
		sky.environment.background_intensity = 1
	sky.environment.adjustment_brightness = p
	sky.environment.background_energy_multiplier = p
	sky.environment.background_intensity = p * intensity
	if (sky.environment.adjustment_brightness <= step
		or sky.environment.adjustment_brightness >= 1.0):
		phase = -phase
	printt(
		phase, p,
		sky.environment.adjustment_brightness,
		sky.environment.background_energy_multiplier,
		sky.environment.background_intensity
	)
	
