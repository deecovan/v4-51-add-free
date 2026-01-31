extends Timer

@export var energy = 1.0
@export var intensity = 9600
@export var intensity_min = 1600
@export var p_norm: float = 0.00
@export var p_min:  float = 0.05
@export var step = 0.001
@export var speed = 0.05
var p: float
var q: float
var sky: WorldEnvironment
var light: DirectionalLight3D
var cam: Camera3D
var gimbal: SpringArm3D
var sun: Sprite3D

func _ready() -> void:
	sky = get_parent()
	cam = get_viewport().get_camera_3d()
	light = $"../DirectionalLight3D"
	gimbal = $"../SpringArm3D"
	sun = $"../SpringArm3D/Sun"
	wait_time = speed
	autostart = true
	start()
	p_norm = update_sky(p, p * intensity, p_norm, step)

## Update sky and Warp "p" var if p>1
## Added normalization for intensity_min and p_min
func update_sky(_p, _intensity, _p_norm, _step) -> float:
	## Normalize minimums
	if _intensity < intensity_min:
		_intensity = intensity_min
	if _p < p_min:
		_p = p_min
	sky.environment.adjustment_brightness = _p
	sky.environment.background_energy_multiplier = _p
	sky.environment.adjustment_saturation = _p
	sky.environment.background_intensity = _intensity
	## Warp P if need
	_p_norm += _step
	if  _p_norm >= 1.0:
		_p_norm = -1.0
	return _p_norm

func set_light(_p, _q) -> void:
	light.rotation.x = -p
	light.rotation.y = 2 * q
	light.rotation.z = p - q
	if cam.position:
		var tween = create_tween().set_parallel(true) # Run at same time
		tween.tween_property(gimbal, "position", cam.position, speed)
		tween.tween_property(gimbal, "rotation", light.rotation, speed)
		light.position = sun.position

func _on_timeout() -> void:
	p = sin( PI*p_norm )
	q = cos( PI*p_norm )
	p_norm = update_sky(p, p * intensity, p_norm, step)
	set_light(p, q)	
	#
	#print("---")
	#printt(p_norm, p, q) 
	#printt(var_to_str(light.rotation))
	#printt(
		#sky.environment.adjustment_brightness,
		#sky.environment.background_energy_multiplier,
		#sky.environment.background_intensity
	#)
	
