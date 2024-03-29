extends Node2D

const FORE := Color.YELLOW
const FORE_DESTROYED := Color(.3, .3, .3)
const FILL := Color.BLACK

var size:float
var verts:Array[Vector2]
var color:Color

func _ready():
    self.size = get_parent().SIZE
    self.verts = get_verts()
    self.reset()

func _draw():
    draw_polygon(self.verts, [FILL])
    draw_polyline(self.verts, self.color, 2.0, true)

func get_verts() -> Array[Vector2]:
    # A rectangular gun turret, pointing +x
    return [
        Vector2(     0,  size/16), # left(base) top
        Vector2(size/2,  size/16), # right(tip) top
        Vector2(size/2, -size/16), # right(tip) bottom
        Vector2(     0, -size/16), # left(base) bottom
    ]

func reset():
    self.color = FORE
    self.queue_redraw()

func destroy() -> void:
    self.color = FORE_DESTROYED
    self.queue_redraw()
