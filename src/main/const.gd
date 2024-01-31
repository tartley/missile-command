class_name Common extends Node

# The ground is a pizza-slice shaped segment of a circular planet, centered at (0, 0), with:
const RADIUS := 12000.0
# extending for PLANET_ANGLE radians on either side of 'straight up':
const PLANET_ANGLE := PI / 16.0

static func get_unique_name(obj:Node, name_:String=obj.name) -> String:
    return "{0}-{1}".format([name_, obj.get_instance_id()])