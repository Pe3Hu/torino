extends CharacterBody2D


var parent = null


func set_parent(parent_) -> void:
	parent = parent_
	init_shape()


func init_shape() -> void:
	var node = get_parent().get_parent().get_parent()
	var size_ = node.size#Vector2(100,100)#
	size_.x -= node.get("theme_override_constants/margin_left")
	size_.x -= node.get("theme_override_constants/margin_right")
	size_.y -= node.get("theme_override_constants/margin_top")
	size_.y -= node.get("theme_override_constants/margin_bottom")
	size_ *= 0.5
	
	var vertexs = []
	var vertex = null
	var a = -size_
	var b = -size_
	
	match parent.word.side:
		"top":
			b.x += size_.x*2
		"bottom":
			a = size_
			b = size_
			a.x -= size_.x*2
		"left":
			b.y += size_.y*2
		"right":
			a = size_
			b = size_
			a.y -= size_.y*2
	
	vertex = a + Vector2(-1,-1)*Global.num.size.grenze.margin
	vertexs.append(vertex)
	vertex = a + Vector2(-1,1)*Global.num.size.grenze.margin
	vertexs.append(vertex)
	vertex = b + Vector2(1,-1)*Global.num.size.grenze.margin
	vertexs.append(vertex)
	vertex = b + Vector2(1,1)*Global.num.size.grenze.margin
	vertexs.append(vertex)
	
	$CollisionPolygon2D.set_polygon(vertexs)
	$Polygon2D.set_polygon(vertexs)
	collision_layer = 2
	collision_mask = 2
		#area.set_collision_mask_value(2, true)
		#area.set_collision_layer_value(2, true)
