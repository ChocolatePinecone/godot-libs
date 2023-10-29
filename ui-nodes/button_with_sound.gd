tool
class_name ButtonWithSound
extends TextureButton
# A button with easy settable sounds for button actions


export var press_sound: AudioStream setget _set_press_sound
export var release_sound: AudioStream setget _set_release_sound

var is_hovered: bool = false


func _ready():
	var _bd = connect("button_down", self, "_play_press_sound")
	var _bu = connect("button_up", self, "_on_press_stop")


func call_set_press_sound(new_sound: AudioStream):
	call_deferred("_set_press_sound", new_sound)

func _set_press_sound(new_sound: AudioStream):
	press_sound = new_sound
	$PressSound.stream = new_sound


func call_set_release_sound(new_sound: AudioStream):
	call_deferred("_set_release_sound", new_sound)

func _set_release_sound(new_sound: AudioStream):
	release_sound = new_sound
	$ReleaseSound.stream = new_sound


func _input(event: InputEvent):
	if event is InputEventMouseMotion:
		var mouse_position = event.position
		var mouse_hovering = get_global_rect().has_point(mouse_position)
		if is_hovered != mouse_hovering:
			_update_hover_state(mouse_hovering)


# Update current hover state
# Will also play sounds if hover state changes while button is pressed
func _update_hover_state(hovered: bool):
	if pressed:
		if hovered == false:
			_play_release_sound()
		else:
			_play_press_sound()
	
	is_hovered = hovered
	


# Play the press sound
func _play_press_sound():
	if press_sound:
		$PressSound.play()


# Play the press sound
func _play_release_sound():
	if release_sound:
		$ReleaseSound.play()


# When button is no longer pressed
func _on_press_stop():
	if is_hovered:
		_play_release_sound()
