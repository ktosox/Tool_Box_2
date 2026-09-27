extends Camera3D

var cubemap_template = preload("res://texel_splating/cubemap_template.png")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:


	
# Fill in an array of Images with different colors.
	var images = []
	const LAYERS = 6
	for i in LAYERS:
		var image = Image.create_empty(128, 128, false, Image.FORMAT_RGB8)
		if i % 3 == 0:
			image.fill(Color.RED)
		elif i % 3 == 1:
			image.fill(Color.GREEN)
		else:
			image.fill(Color.BLUE)
		images.push_back(image)

	# Create and save a 2D texture array. The array of images must have at least 1 Image.
	var texture_2d_array = Texture2DArray.new()
	texture_2d_array.create_from_images(images)
	ResourceSaver.save(texture_2d_array, "res://texel_splating/texture_2d_array.res", ResourceSaver.FLAG_COMPRESS)

	# Create and save a cubemap. The array of images must have exactly 6 Images.
	# The cubemap's images are specified in this order: X+, X-, Y+, Y-, Z+, Z-
	# (in Godot's coordinate system, so Y+ is "up" and Z- is "forward").
	var cubemap = Cubemap.new()
	cubemap.create_from_images(images)
	ResourceSaver.save(cubemap, "res://texel_splating/cubemap.tres", ResourceSaver.FLAG_COMPRESS)
	var mesh = $MeshInstance3D.mesh as BoxMesh
	var material = mesh.material as ShaderMaterial
	material.set_shader_parameter("source_panorama",cubemap)





# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
