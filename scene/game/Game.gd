extends Node


func _ready() -> void:
	Global.obj.segeltuch = Classes_1.Segeltuch.new()
	#datas.sort_custom(func(a, b): return a.value < b.value) 012
	
	


func _input(event) -> void:
	if event is InputEventKey:
		match event.keycode:
			KEY_SPACE:
				if event.is_pressed() and !event.is_echo():
					Global.obj.segeltuch.canvas_check()
			KEY_A:
				if event.is_pressed():
					Global.obj.segeltuch.zoom(-0.1)
			KEY_D:
				if event.is_pressed():
					Global.obj.segeltuch.zoom(0.1)
					
					#for border in Global.obj.segeltuch.scene.myself.get_node("Border").get_children():
					#	print(border.get_overlapping_areas())
					


func _process(delta_) -> void:
	$FPS.text = str(Engine.get_frames_per_second())
	
	#for border in Global.obj.segeltuch.scene.myself.get_node("Border").get_children():
	#	print(border.get_overlapping_areas())
