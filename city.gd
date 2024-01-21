extends Node2D

const COLUMNS := 7
const SIZE := 100.0

var destroyed: bool = false

func get_regular_verts():
    var retval: Array[Vector2] = []
    var heights:Array[int] = [20, 20, 30, 40, 40, 50, 50]
    heights.shuffle()
    retval.append(Vector2(-SIZE/2.0, 0))
    for column in range(COLUMNS):
        retval.append(Vector2(-SIZE/2.0 + column * SIZE/COLUMNS, heights[column]))
        retval.append(Vector2(-SIZE/2.0 + (column + 1) * SIZE/COLUMNS, heights[column]))
    retval.append(Vector2(+SIZE/2.0, 0))
    return retval

func get_destroyed_verts():
    var retval: Array[Vector2] = []
    var heights:Array[int] = [10, 10, 20, 20, 20, 30, 30]
    heights.shuffle()
    retval.append(Vector2(-SIZE/2.0, 0))
    for column in range(COLUMNS):
        retval.append(Vector2(-SIZE/2.0 + column * SIZE/COLUMNS, heights[column]))
    retval.append(Vector2(+SIZE/2.0, 0))
    return retval

func _ready() -> void:
    self.rotation = position.angle() - PI / 2

func _draw():
    var verts:Array[Vector2]
    var color:Color
    if self.destroyed:
        verts = get_destroyed_verts()
        color = Color(.4, .4, .4)
    else:
        verts = get_regular_verts()
        color = Color.RED
    draw_polyline(verts, color, 4.0, true)
