extends VBoxContainer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for button in self.get_children():
		button.mouse_entered.connect(_on_button_hover.bind(button))
		button.mouse_exited.connect(_on_button_exit.bind(button))	
		
func _on_button_hover(button: Button):
	button.text = "> " + button.text
	
func _on_button_exit(button: Button):
	button.text = button.text.trim_prefix("> ")
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
