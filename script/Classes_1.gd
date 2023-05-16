extends Node


#Граница grenze
class Grenze:
	var vec = {}
	var word = {}
	var obj = {}
	var scene = {}


	func _init(input_):
		obj.segeltuch = input_.segeltuch
		word.side = input_.side
		vec.position = Vector2()
		init_scene()


	func init_scene() -> void:
		scene.myself = Global.scene.grenze.instantiate()
		obj.segeltuch.scene.myself.get_node("Grenze").add_child(scene.myself)
		scene.myself.set_parent(self)


#Дыра loch
class Loch:
	var vec = {}
	var num = {}
	var obj = {}
	var scene = {}


	func _init(input_):
		vec.position = Vector2()
		num.x = input_.x
		num.y = input_.y
		num.r = input_.r
		num.theta = input_.theta
		obj.segeltuch = input_.segeltuch
		set_start_position()
		init_scene()


	func init_scene() -> void:
		scene.myself = Global.scene.loch.instantiate()
		obj.segeltuch.scene.myself.get_node("Loch").add_child(scene.myself)
		scene.myself.set_parent(self)


	func set_start_position() -> void:
		var shift = Vector2()
		var a = num.r*Global.num.size.segeltuch.a*Global.num.size.segeltuch.zoom
		
		if num.x != null and num.y != null:
			pass
		
		if num.r != null and num.theta != null:
			vec.position = Vector2(a,0).rotated(-num.theta)


#Холст segeltuch
class Segeltuch:
	var arr = {}
	var dict = {}
	var obj = {}
	var scene = {}


	func _init():
		init_scene()
		init_grenze()
		init_loch()


	func init_scene() -> void:
		scene.myself = Global.scene.segeltuch.instantiate()
		Global.node.game.get_node("Layer1").add_child(scene.myself)
		scene.myself.set_parent(self)


	func init_grenze() -> void:
		dict.grenze = {}
		var sides = ["top","bottom","left","right"]
		
		for side in sides:
			var input = {}
			input.side = side
			input.segeltuch = self
			var grenze = Classes_1.Grenze.new(input)
			dict.grenze[grenze] = side
		
		var a = scene.myself.get_node("Grenze").get_children()
		


	func init_loch() -> void:
		arr.loch = []
		
		for _i in Global.num.size.loch.n:
			var input = {}
			input.segeltuch = self
			input.x = null
			input.y = null
			input.r = _i
			input.theta = _i
			var loch = Classes_1.Loch.new(input)
			arr.loch.append(loch)


	func canvas_check():
		var on_canvas = []
#		var on_border = []
#
#		for border in scene.myself.get_node("Grenze").get_children():
#			var areas = border.get_overlapping_areas()
#
#			for area in areas:
#				if area.name.contains("Loch") and !on_border.has(area):
#					on_border.append(area.parent)
		
		for area in scene.myself.get_node("Canvas").get_overlapping_areas():
			if area.name.contains("Loch"):# and !on_border.has(area.parent):
				on_canvas.append(area.parent)
		
		for loch in arr.loch:
			loch.scene.myself.visible = on_canvas.has(loch)


	func zoom_old(zoom_: float) -> void:
		if Global.num.size.segeltuch.zoom + zoom_ > 0.25:
			Global.num.size.segeltuch.zoom += zoom_
			for loch in arr.loch:
				loch.scene.myself.set_center()
			
			canvas_check()


	func zoom(zoom_: float) -> void:
		if Global.num.size.segeltuch.zoom + zoom_ > 0.25:
			Global.num.size.segeltuch.zoom += zoom_
			#scene.myself.scale = Vector2(1,1)*Global.num.size.segeltuch.zoom
			scene.myself.unzoom()
			canvas_check()
			print(arr.loch.back().scene.myself.position)
