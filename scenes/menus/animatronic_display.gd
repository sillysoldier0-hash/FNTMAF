extends Control

var sprites
var current_sprite
var flicker_count = 0
var prev_sprite
var flicker_duration = randi_range(3,6)
var sprites_dark
var randomnumber
var dark_sprite

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	sprites = $LightAnimatronics.get_children()
	sprites_dark = $DarkAnimatronics.get_children()
	randomnumber = randi_range(0,len(sprites)-1)
	current_sprite = sprites[randomnumber]
	dark_sprite = sprites_dark[randomnumber]
	current_sprite.visible = true
	dark_sprite.visible = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_flicker_timer_timeout() -> void:
	$"../FlickerDuration".start()
	
func _on_flicker_duration_timeout() -> void:
	current_sprite.visible = not current_sprite.visible
	flicker_count += 1
	if flicker_count >= flicker_duration:
		flicker_duration = randi_range(6,7)
		if flicker_duration % 2 == 1:
			flicker_duration -= 1
		$"../FlickerDuration".stop()
		current_sprite.visible = true
		flicker_count = 0
		dark_sprite.visible = false
		current_sprite.visible = false
		prev_sprite = current_sprite
		while current_sprite == prev_sprite:
			randomnumber = randi_range(0,len(sprites)-1)
			current_sprite = sprites[randomnumber]
			dark_sprite = sprites_dark[randomnumber]
		current_sprite.visible = true
		dark_sprite.visible = true
		$"../FlickerTimer".start(randf_range(4,6))
		
	
