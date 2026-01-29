extends Node

## Copied from Fanta1000
@onready var _timer = $"../Timer"
@onready var _start = $"../Start"
@onready var _idle = $"../Idle"
@onready var _pow = $"../Pow"
@onready var _run = $"../Run"
var vehicle
var vel
var power
var max_s
var max_p
var snd_start
var rem_engine_index
var vol = -0.6
## @NEW Engine Index RPM to use GearBox
var eng_rpm = 1.0
var eng_ind_rpm = []
## Sound Scale from velocity, Volume from power
var scale_rpm = 1.0
var twenty_four = 24.0

func _ready():
	vehicle = get_parent()
	max_s = vehicle.MAX_SPEED
	max_p = vehicle.MAX_POWER
	snd_start = max_s / 32
	_pow.volume_db = -24.0
	_run.volume_db = -24.0
	_timer.connect("timeout", on_timer_timeout)
	_start.play()
	_timer.start()
	## @NEW Engine Index RPM to use GearBox
	eng_ind_rpm = vehicle.eng_ind_rpm
	
func _physics_process(_delta: float) -> void:
	power = vehicle.engine_force
	vel = abs(vehicle.get_local_velocity().z)
	vol = power / max_p
	
	## Get Engine Index RPM to use GearBox
	scale_rpm = vehicle.s_scale_rpm
	## Fix sound's overscale when gearing down
	if scale_rpm > 1:
		scale_rpm = 1
		vol = -twenty_four
	
	if (rem_engine_index != vehicle.engine_index
		and not $"../Gear".playing):
		rem_engine_index = vehicle.engine_index
		$"../Gear".play()
	
	## Start sounds
	if not _start.playing and not _idle.playing:
		_idle.play()
	if not _start.playing and not _pow.playing:
		_pow.play()
	if not _start.playing and not _run.playing:
		_run.play()
	
	var vel_start = abs(
		vehicle.get_local_velocity().z
		) * eng_ind_rpm.min()
	if vel_start > snd_start:
		_idle.pitch_scale = scale_rpm
		_pow.pitch_scale = scale_rpm
		_run.pitch_scale = vel / vehicle.MAX_SPEED
		_pow.volume_db = clamp(
			vol * twenty_four - twenty_four, 
			-twenty_four, 0.0)
		_run.volume_db = clamp(
			(vel * abs(vehicle.ACCELERATING)) \
			* twenty_four - twenty_four, 
			-twenty_four, -twenty_four/2)
	
	## Randomise loops
	if randf() > 0.9 and _idle.playing: _idle.play()
	if randf() > 0.9 and _pow.playing: _pow.play()
	if randf() > 0.9 and _run.playing: _run.play()

func on_timer_timeout():
	_start.stop()
	_idle.play()
