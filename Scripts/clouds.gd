extends MeshInstance3D

@onready var TimeScaleHSlider : HSlider = $"../Control/TImeScale"
@onready var CloudDensityHSlider : HSlider = $"../Control/CloudDensity"
@onready var CloudScaleHSlider : HSlider = $"../Control/CloudScale"
@onready var shaderMaterial = self.get_active_material(0)

func _ready():
	# Set up sliders with min, max, and step values
	# Set up sliders with min, max, and step values
	TimeScaleHSlider.min_value = 0.0
	TimeScaleHSlider.max_value = 1.0
	TimeScaleHSlider.step = 0.01
	TimeScaleHSlider.value = 0.2  # Set initial value for visibility
	
	CloudDensityHSlider.min_value = 0.0
	CloudDensityHSlider.max_value = 1.0
	CloudDensityHSlider.step = 0.01
	CloudDensityHSlider.value = 0.5  # Set initial value for visibility
	
	CloudScaleHSlider.min_value = 0.1
	CloudScaleHSlider.max_value = 10.0
	CloudScaleHSlider.step = 0.1
	CloudScaleHSlider.value = 0.3  # Set initial value for visibility

	# Connect slider signals to their respective functions
	TimeScaleHSlider.connect("value_changed", Callable(self, "_on_time_scale_changed"))
	CloudDensityHSlider.connect("value_changed", Callable(self, "_on_cloud_density_changed"))
	CloudScaleHSlider.connect("value_changed", Callable(self, "_on_cloud_scale_changed"))

func _process(delta):
	# Update shader parameters based on the current slider values
	update_shader_parameters()

func update_shader_parameters():
	if shaderMaterial and shaderMaterial.shader:
		shaderMaterial.set_shader_parameter("time_scale", TimeScaleHSlider.value)
		shaderMaterial.set_shader_parameter("cloud_density", CloudDensityHSlider.value)
		shaderMaterial.set_shader_parameter("cloud_scale", CloudScaleHSlider.value)

func _on_time_scale_changed(value):
	shaderMaterial.set_shader_parameter("time_scale", value)

func _on_cloud_density_changed(value):
	shaderMaterial.set_shader_parameter("cloud_density", value)

func _on_cloud_scale_changed(value):
	shaderMaterial.set_shader_parameter("cloud_scale", value)
