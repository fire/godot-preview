# Copyright © 2019 Hugo Locurcio and contributors - MIT License
# See `LICENSE.md` included in the source distribution for details.

extends Camera

var images = {}
var frame_acc = 0

func _ready() -> void:
#	if OS.has_feature("standalone"):
#		get_viewport().msaa = Viewport.MSAA_2X
#		get_viewport().size *= 4
	var directory: = Directory.new()
	directory.list_dir_begin()
	if directory.dir_exists("user://actual"):
		rm_contents("user://actual")
	directory.make_dir("user://actual")


func rm_contents(path):
	var dir = Directory.new()
	if dir.open(path) == OK:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while (file_name != ""):
#			if dir.current_is_dir():
#				print("Found directory: " + file_name)
#			else:
#				print("Removed file: " + file_name)
			file_name = dir.get_next()
			dir.remove(file_name)
	else:
		print("An error occurred when trying to access the path.")

func _process(delta):
#	if OS.has_feature("standalone"):
	# The first frame is always black, there's no point in saving it
	if Engine.get_frames_drawn() == 0:
		return
	if Engine.get_frames_drawn() <= frame_acc + 60:
		return
	frame_acc = Engine.get_frames_drawn()
	print("Rendering frame {frame}...".format({
				frame = Engine.get_frames_drawn(),
			})
	)
	get_viewport().set_clear_mode(Viewport.CLEAR_MODE_ONLY_NEXT_FRAME)

	var image := get_viewport().get_texture().get_data()
#		image.generate_mipmaps()
#		image.resize(
#				get_viewport().size.x / 4,
#				get_viewport().size.y / 4,
#				Image.INTERPOLATE_TRILINEAR
#		)

	# The viewport must be flipped to match the rendered window
	image.flip_y()
	images[Engine.get_frames_drawn()] = image

func _on_AnimationPlayer_animation_finished(anim_name):
	for i in images:
		var image : Image = images[i]
		var error := image.save_png("user://actual/" + str(i) + ".png")
	get_tree().quit()