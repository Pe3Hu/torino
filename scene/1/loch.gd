extends Area2D


var parent = null


func set_parent(parent_) -> void:
	parent = parent_
	update_position()
	set_vertex()
	set_collision_mask_value(2, true)
	set_collision_layer_value(2, true)


func update_position() -> void:
	position = parent.vec.position*Global.num.size.segeltuch.zoom
	visible = true
	#for border in parent.obj.segeltuch.scene.myself.get_node("Border").get_children():
	#	print(border.get_overlapping_areas())


func set_vertex() -> void:
	var order = "even"
	var corners = 4
	var r = Global.num.size.loch.r
	var vertexs = []
	
	for corner in corners:
		var a = Global.dict.corner.vector
		var vertex = Global.dict.corner.vector[corners][order][corner]*r
		vertexs.append(vertex)
	
	$Polygon2D.set_polygon(vertexs)
	$CollisionPolygon2D.set_polygon(vertexs)


func check_on_screen() -> void:
	pass#collisin
