extends Line2D


func _ready():
	var static_body = StaticBody2D.new()
	static_body.collision_layer = 1 + 4
	static_body.collision_mask = 1 + 4
	
	for i in get_point_count() - 1:
		var p1 = get_point_position(i)
		var p2 = get_point_position(i+1)
		
		var collision_shape = CollisionShape2D.new()
		var shape = RectangleShape2D.new()
		
		shape.size = Vector2((p2-p1).length(), 32)
		
		collision_shape.shape = shape
		collision_shape.position = (p2-p1) / 2 + p1
		collision_shape.rotation = Vector2(p2 - p1).angle()
		
		static_body.add_child(collision_shape)
	
	add_child(static_body)
		
