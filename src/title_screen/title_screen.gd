class_name TitleScreen extends Node2D

const font:FontFile = preload("res://fonts/Orbitron Medium.otf")

func _ready():
    for missile in get_tree().get_nodes_in_group("missiles"):
        missile.destroy()

func _draw():
    var rect = get_viewport_rect()
    var height = rect.size.y / 3
    draw_string(font, Vector2(0, height), "Missile Commander", HORIZONTAL_ALIGNMENT_CENTER, rect.size.x, 256, Color.BLACK)
    draw_string_outline(font, Vector2(0, height), "Missile Commander", HORIZONTAL_ALIGNMENT_CENTER, rect.size.x, 256, 8, Color.CYAN)
    draw_string(
        font, Vector2(0, rect.size.y / 2), "[A] or [S] or [D] to fire from each base",
        HORIZONTAL_ALIGNMENT_CENTER, rect.size.x, 64, Color.DARK_CYAN
    )
    draw_string(
        font, Vector2(0, rect.size.y / 2 + 128), "Press fire to start",
        HORIZONTAL_ALIGNMENT_CENTER, rect.size.x, 64, Color.CYAN
    )
    var vstr : String = "Version %s - A work in progress." % ProjectSettings.get_setting("application/config/version", "unknown")
    draw_string(
        font, Vector2(rect.position.x + 16, rect.end.y - 16), vstr, HORIZONTAL_ALIGNMENT_LEFT, rect.size.x, 48, Color("666")
    )


func _unhandled_input(event:InputEvent):
    if event is InputEventKey and event.pressed and not event.echo:
        match event.keycode:
            KEY_A:
                queue_free()
            KEY_W:
                queue_free()
            KEY_S:
                queue_free()
            KEY_D:
                queue_free()
