# No class name because this is autoloaded and gets its name there
extends CanvasLayer
# Responsible for fading the screen to and from black.


signal fade_to_black_complete()
signal fade_from_black_complete()

onready var black_screen_fader: Fader = $BlackScreenFader


func _ready():
	var _fic = black_screen_fader.connect("fade_in_complete", self, "_fade_complete", [true])
	var _foc = black_screen_fader.connect("fade_out_complete", self, "_fade_complete", [false])


# Start fading out the screen by fading in the black screen
func fade_to_black():
	black_screen_fader.fade_in()


# Start fading in the screen by fading out the black screen
func fade_from_black():
	black_screen_fader.fade_out()


func _fade_complete(screen_faded_to_black: bool):
	if screen_faded_to_black:
		emit_signal("fade_to_black_complete")
	else:
		emit_signal("fade_from_black_complete")
