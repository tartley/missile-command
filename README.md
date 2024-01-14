# Missile Command 2023

With vector graphics,
by [Jonathan Hartley](https://mastodon.social/@tartley),
using [Godot](https://godotengine.org/).

## TODO

* Main has script 'main.gd', which contains startup orchestration,
  including DI required so one child node knows about others it needs.
  Child nodes which require such setup should @tool run
  `_get_configuration_warnings()`, which returns a non-empty PackedStringArray
  to generate warnings if they are not configured.
* Can we have a linear chain of dependencies, not a tangled web?

* Re-org co-ordinates
  - One camera
  * set it to show a large area so we can see everything
    (or should this be in the editor?)
  * ground renders with (0, 0) at planet center
  * mouse moves in a polar segment
  * camera pan left right, in a polar manner so with tilt
    such that ground rotates beneath us properly
    (Should work even with high rotation values)
  * camera also pans up down slightly (polar though)
  * Stars on a parallax background
    https://docs.godotengine.org/en/stable/classes/class_parallaxbackground.html

* How to raise an error from ground? (see TODO there)

* Add previews in the editor?
  https://docs.godotengine.org/en/stable/tutorials/plugins/running_code_in_the_editor.html#doc-running-code-in-the-editor
  * Ground?
  * Camera and mouse max extents?
  * Star max extents?

* bombs rain down
  * I don't think they need to be polar.
  * Consider drawing creation area for editor?

* 3 bases exist.
  * Ask the ground where they are placed
  * extract an "annotatedArray" class?
  * Read about structs?
* 6 cities exist. Likewise.

## Done

* Draw the ground using triangle mesh
* Draw the ground, with hills, using a polygon
* Draw the ground as a curved planet surface, with hills, using a polygon
  with the surface at the center at world co-ordinates 0,0.
* Embed "features" in the ground surface, so we can later ask the ground
  for the world co-ords of bases & cities.
* Add a static camera, giving us a sensible view centered above the ground.
  with scaling to correct for window size/aspect.
* get rid of that camera x2 zoom.
  Just draw everything 2x bigger, surely?
* mouse cursor in world co-ordinates

# Sharing code between nodes
* Scripts for globally useful functions like polar conversion might go:
  * In a Singleton, aka "Autoload" node, which are enumerated in the Project
    settings, autoload tab, and can them be accessed by name from any Node.
  * Consider autoload nodes with `static func` or `static var`,
    to create helper functions without having to create an instance to call
    them.
  * Use `class_name` to register your script as a new named type in the editor.
  * Use `extends XXX` to inherit from an existing Node or other type. If not
    specified, everything inherits from `RefCounted`. Only explicitly `virtual`
    methods can be reliably overriden. Methods include `_init` and
    `_static_init`.
  * All in one: `class_name Character extends Entity`

