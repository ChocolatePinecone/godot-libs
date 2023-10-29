class_name Fader
extends Tween
# Provides fading utilities for the linked Node


signal fade_out_complete()
signal fade_in_complete()



export var subject_path: NodePath
export var fade_in_duration: float = 0.2
export var fade_out_duration: float = 0.2
export var fade_in_delay: float = 0
export var fade_out_delay: float = 0

export(int, 
	"TRANS_LINEAR",
	"TRANS_SINE",
	"TRANS_QUINT",
	"TRANS_QUART",
	"TRANS_QUAD",
	"TRANS_EXPO",
	"TRANS_ELASTIC",
	"TRANS_CUBIC",
	"TRANS_CIRC",
	"TRANS_BOUNCE",
	"TRANS_BACK"
	) var fade_out_transition: int = Tween.TRANS_LINEAR
export(int, 
	"TRANS_LINEAR",
	"TRANS_SINE",
	"TRANS_QUINT",
	"TRANS_QUART",
	"TRANS_QUAD",
	"TRANS_EXPO",
	"TRANS_ELASTIC",
	"TRANS_CUBIC",
	"TRANS_CIRC",
	"TRANS_BOUNCE",
	"TRANS_BACK"
	) var fade_in_transition: int = Tween.TRANS_LINEAR
export(int, 
	"EASE_IN", 
	"EASE_OUT", 
	"EASE_IN_OUT", 
	"EASE_OUT_IN"
	) var fade_out_ease: int = Tween.EASE_IN_OUT
export(int, 
	"EASE_IN", 
	"EASE_OUT", 
	"EASE_IN_OUT", 
	"EASE_OUT_IN"
	) var fade_in_ease: int = Tween.EASE_IN_OUT

var subject: Node setget set_subject
var initial_color: Color
var invisible_color: Color
var fading_out = false


func _ready():
	var _tc = connect("tween_completed", self, "_fade_completed")
	
	if subject_path:
		set_subject_by_path(subject_path)


# Use a node path to get the subject and save it
func set_subject_by_path(path: NodePath):
	var subject_node = get_node(path)
	set_subject(subject_node)


# Set the subject to use fading capabilities on
func set_subject(node: Node):
	subject = node
	initial_color = subject.modulate
	invisible_color = Color(initial_color.r, initial_color.g, initial_color.b, 0)


# Set the subject to use fading capabilities on, while ignoring the initial color of the subject
func set_subject_ignore_color(node: Node):
	subject = node
	initial_color = Color.white
	invisible_color = Color.transparent

# Fade the subject from invisible to its normal opacity
func fade_in():
	if is_active():
		var _ra = remove_all()
	var _ip = interpolate_property(
		subject, "modulate",
		invisible_color, initial_color, fade_in_duration,
		fade_in_transition, fade_in_ease, fade_in_delay
	)
	subject.visible = true
	var _s = start()


# Fade the subject from invisible to its normal opacity
func fade_out():
	if is_active():
		var _ra = remove_all()
	var _ip = interpolate_property(
		subject, "modulate",
		initial_color, invisible_color, fade_out_duration,
		fade_out_transition, fade_out_ease, fade_out_delay
	)
	fading_out = true
	var _s = start()


# When a fade is completed
func _fade_completed(_object: Object, _key: NodePath):
	var _ra = remove_all()
	if fading_out:
		subject.visible = false
		fading_out = false
		emit_signal("fade_out_complete")
	else:
		emit_signal("fade_in_complete")


# Directly make the subject visible
func make_visible():
	var _ra = remove_all()
	subject.modulate = initial_color
	subject.visible = true
