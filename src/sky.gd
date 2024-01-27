extends Node2D

func _draw():
    var verts: Array[Vector2] = []
    var colors: Array[Color] = []
    var x: float
    var y: float
    var size:float
    var bright: float
    for i in range(1000):
        x = randf_range(-2800.0, 2800.0)
        y = randf_range(
            %Ground.RADIUS - get_viewport_rect().size.y * 0.14,
            %Ground.RADIUS + get_viewport_rect().size.y * 1.04
        )
        size = randf_range(4.0, 8.0)
        bright = randf_range(0.5, 1.0)
        verts.append(Vector2(x, y))
        verts.append(Vector2(x + size, y))
        colors.append(Color(bright, bright, bright))
    draw_multiline_colors(verts, colors, size)