extends MarginContainer


var parent = null


func set_parent(parent_) -> void:
	parent = parent_
	
	init_canvas()
	init_axis()


func init_axis() -> void:
	var axis = ["x","y"]
	var size_ = get_parent().size
	size_.x -= get_parent().get("theme_override_constants/margin_left")
	size_.x -= get_parent().get("theme_override_constants/margin_right")
	size_.y -= get_parent().get("theme_override_constants/margin_top")
	size_.y -= get_parent().get("theme_override_constants/margin_bottom")
	size_ *= 0.5
	Global.num.size.segeltuch.a = float(max(size_.x,size_.y))/Global.num.size.loch.n
	
	for axis_ in axis:
		var line = Line2D.new()
		line.default_color = Color.BLACK
		line.width = 10
		
		match axis_:
			"x":
				var vertex = Vector2()
				vertex.x -= size_.x
				line.add_point(vertex)
				vertex = Vector2()
				vertex.x += size_.x
				line.add_point(vertex)
			"y":
				var vertex = Vector2()
				vertex.y -= size_.y
				line.add_point(vertex)
				vertex = Vector2()
				vertex.y += size_.y
				line.add_point(vertex)
		
		$Axis.add_child(line)


func init_canvas() -> void:
	var size_ = get_parent().size
	size_.x -= get_parent().get("theme_override_constants/margin_left")
	size_.x -= get_parent().get("theme_override_constants/margin_right")
	size_.y -= get_parent().get("theme_override_constants/margin_top")
	size_.y -= get_parent().get("theme_override_constants/margin_bottom")
	$Canvas/CollisionShape2D.shape.size = size_


func unzoom() -> void:
	get_node("Loch").scale = Vector2(1,1)*Global.num.size.segeltuch.zoom
	
	for child in get_node("Loch").get_children():
		child.scale = Vector2(1,1)/Global.num.size.segeltuch.zoom
		child.update_position()
