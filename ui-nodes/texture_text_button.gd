tool
class_name TextureTextButton
extends ButtonWithSound
# A button that shows a background texture and a text


const TEXT_POSITION = Vector2(3, 4)

export(String, MULTILINE) var text: String setget _call_set_text
export(int, "Left", "Center", "Right", "Fill") var align: int setget _call_set_align
export(int, "Top", "Center", "Bottom", "Fill") var v_align: int setget _call_set_v_align
export(Vector2) var text_offset: Vector2 setget _call_set_text_offset
export(bool) var autowrap: bool setget _call_set_autowrap
export(bool) var clip_text: bool setget _call_set_clip_text
export(bool) var uppercase: bool setget _call_set_uppercase
export(DynamicFont) var font: DynamicFont setget _call_set_font
export(Color) var font_color: Color setget _call_set_font_color


func _call_set_text(new_text: String):
	call_deferred("_set_text", new_text)

func _set_text(new_text: String):
	text = new_text
	$Label.text = new_text


func _call_set_align(new_align: int):
	call_deferred("_set_align", new_align)

func _set_align(new_align: int):
	align = new_align
	$Label.align = new_align


func _call_set_v_align(new_v_align: int):
	call_deferred("_set_v_align", new_v_align)

func _set_v_align(new_v_align: int):
	v_align = new_v_align
	$Label.valign = new_v_align


func _call_set_text_offset(new_text_offset: Vector2):
	call_deferred("_set_text_offset", new_text_offset)

func _set_text_offset(new_text_offset: Vector2):
	text_offset = new_text_offset
	$Label.rect_position = TEXT_POSITION + new_text_offset


func _call_set_autowrap(new_autowrap: bool):
	call_deferred("_set_autowrap", new_autowrap)

func _set_autowrap(new_autowrap: bool):
	autowrap = new_autowrap
	$Label.autowrap = new_autowrap


func _call_set_clip_text(new_clip_text: bool):
	call_deferred("_set_clip_text", new_clip_text)

func _set_clip_text(new_clip_text: bool):
	clip_text = new_clip_text
	$Label.clip_text = new_clip_text


func _call_set_uppercase(new_uppercase: bool):
	call_deferred("_set_uppercase", new_uppercase)

func _set_uppercase(new_uppercase: bool):
	uppercase = new_uppercase
	$Label.uppercase = new_uppercase


func _call_set_font(new_font: DynamicFont):
	call_deferred("_set_font", new_font)

func _set_font(new_font: DynamicFont):
	if new_font:
		$Label.set("custom_fonts/font", new_font)
	else:
		$Label.set("custom_fonts/font", null)
	
	font = new_font


func _call_set_font_color(new_font_color: Color):
	call_deferred("_set_font_color", new_font_color)

func _set_font_color(new_font_color: Color):
	if new_font_color:
		$Label.set("custom_colors/font_color", new_font_color)
	else:
		$Label.set("custom_fonts/font_color", null)
	
	font_color = new_font_color
