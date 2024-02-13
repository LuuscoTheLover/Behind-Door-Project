GDPC                 �                                                                         T   res://.godot/exported/133200997/export-542050d87c78dec139c7fa1f77e82d13-player.scn  �
      z      XI��yG3�%K�`i��    T   res://.godot/exported/133200997/export-aa8524b3965874fe19b6f51335dfb48f-level.scn   �      �#      �֐�*��iy�m�        res://.godot/extension_list.cfg ��      /       R(�C�7r�7hh�W�    ,   res://.godot/global_script_class_cache.cfg  ��      �       �b�2I��J�R,���|    L   res://.godot/imported/icon.svg-218a8f2b3041327d8a5756f3a245f83b.s3tc.ctex   0B      �U      SW!|��2���v�5�U       res://.godot/uid_cache.bin  �      i       �CS��g�.�<:�t
       res://Characters/Aim.gd        \       G|��B�T�."�        res://Characters/player.gd  @      S      sARm>��vz����    $   res://Characters/player.tscn.remap  И      c       ��^`X$�=ք^�0��    $   res://Levels/DirectionalLight3D.gd  P6      $      d���*l�*)I        res://Levels/level.tscn.remap   @�      b       ��Y�WMd*=U�.��p       res://Scripts/Camera.gd �7      �      �P�G��N%ܘ��sy       res://Scripts/DayCicle.gd   P:      �      Z��{�'��J^S["�        res://Scripts/DayNigthCicle.gd  @=      �      7H�l�-W �{Q֘�    0   res://addons/godot-jolt/godot-jolt.gdextension          1      �kO����cĴ��vX�       res://icon.svg  P�      �      C��=U���^Qu��U3       res://icon.svg.import   ��      �       ƃ5ZAJ��	d)M�f�       res://project.binary��      �      �Q��IbTlG�0<�        [configuration]

entry_symbol = "godot_jolt_main"
compatibility_minimum = "4.2"

[libraries]

windows.release.x86_64 = "windows/godot-jolt_windows-x64.dll"
windows.debug.x86_64 = "windows/godot-jolt_windows-x64_editor.dll"

windows.release.x86_32 = "windows/godot-jolt_windows-x86.dll"
windows.debug.x86_32 = "windows/godot-jolt_windows-x86_editor.dll"

linux.release.x86_64 = "linux/godot-jolt_linux-x64.so"
linux.debug.x86_64 = "linux/godot-jolt_linux-x64_editor.so"

linux.release.x86_32 = "linux/godot-jolt_linux-x86.so"
linux.debug.x86_32 = "linux/godot-jolt_linux-x86_editor.so"

macos.release = "macos/godot-jolt_macos.framework"
macos.debug = "macos/godot-jolt_macos_editor.framework"

ios.release = "ios/godot-jolt_ios.framework"
ios.debug = "ios/godot-jolt_ios_editor.framework"

android.release.arm64 = "android/libgodot-jolt_android-arm64.so"
android.debug.arm64 = "android/libgodot-jolt_android-arm64_editor.so"

android.release.arm32 = "android/libgodot-jolt_android-arm32.so"
android.debug.arm32 = "android/libgodot-jolt_android-arm32_editor.so"

android.release.x86_64 = "android/libgodot-jolt_android-x64.so"
android.debug.x86_64 = "android/libgodot-jolt_android-x64_editor.so"

android.release.x86_32 = "android/libgodot-jolt_android-x86.so"
android.debug.x86_32 = "android/libgodot-jolt_android-x86_editor.so"
               extends CharacterBody3D

@onready var pivot = $CameraPivot
@onready var camera = $CameraPivot/Camera3D


const RUN_SPEED = 7
const WALK_SPEED = 4
const JUMP_VELOCITY = 4.5

var speed : int
var gravity = 9.8

#bob const
const BOB_FREQ : float = 2.0
const BOB_AMP : float = 0.08
var bob_time : float = 0.0

func _ready():
	pass

func _process(delta):
	%Hour.text = DayCicle.clock_time
	%Day.text = str(DayCicle.clock.w)

func _physics_process(delta):
	basic_movement(delta)





func basic_movement(delta):
	if not is_on_floor():
		velocity.y -= gravity * delta
		
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	speed = WALK_SPEED
	if Input.is_action_pressed("run"):
		speed = RUN_SPEED

	var input_dir = Input.get_vector("left", "right", "up", "down")
	var direction = (pivot.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	
	velocity.x = move_toward(velocity.x, 0, speed)
	velocity.z = move_toward(velocity.z, 0, speed)
	
	if direction:
		velocity.x = direction.x * speed
		velocity.z = direction.z * speed
	bob_time += delta * velocity.length() * int(is_on_floor())
	camera.transform.origin = head_bob(bob_time)
	
	move_and_slide()
	
func head_bob(time) -> Vector3:
	var pos = Vector3.ZERO
	pos.y = sin(bob_time * BOB_FREQ) * BOB_AMP
	pos.x = cos(bob_time * BOB_FREQ / 2) * BOB_AMP
	return pos
             RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name    lightmap_size_hint 	   material    custom_aabb    flip_faces    add_uv2    uv2_padding    radius    height    radial_segments    rings    script    custom_solver_bias    margin 	   _bundled       Script    res://Characters/player.gd ��������   Script    res://Scripts/Camera.gd ��������   Script    res://Characters/Aim.gd ��������      local://CapsuleMesh_8frw8 t         local://CapsuleShape3D_p80lb �         local://PackedScene_ly6um �         CapsuleMesh             CapsuleShape3D             PackedScene          	         names "         Player    script    CharacterBody3D    MeshInstance3D    mesh    CollisionShape3D    shape    CameraPivot 
   transform    Node3D 	   Camera3D    mouse_sense    Aim    target_position 
   RayCast3D    VBoxContainer    offset_right    offset_bottom    Hour    unique_name_in_owner    layout_mode    text    Label    Day    	   variants                                         �?              �?              �?       ?             )   �������?     �?              �?              �?        �e�              �               B                  hour       node_count    	         nodes     _   ��������       ����                            ����                           ����                     	      ����                    
   
   ����                                ����                                       ����      	      	                    ����      
                                ����      
                   conn_count              conns               node_paths              editable_instances              version             RSRC      extends RayCast3D

@onready var player = $"../../.."

func _ready():
	add_exception(player)
    RSRC                    PackedScene            ��������                                            �      resource_local_to_scene    resource_name    render_priority 
   next_pass    transparency    blend_mode 
   cull_mode    depth_draw_mode    no_depth_test    shading_mode    diffuse_mode    specular_mode    disable_ambient_light    disable_fog    vertex_color_use_as_albedo    vertex_color_is_srgb    albedo_color    albedo_texture    albedo_texture_force_srgb    albedo_texture_msdf 	   metallic    metallic_specular    metallic_texture    metallic_texture_channel 
   roughness    roughness_texture    roughness_texture_channel    emission_enabled 	   emission    emission_energy_multiplier    emission_operator    emission_on_uv2    emission_texture    normal_enabled    normal_scale    normal_texture    rim_enabled    rim 	   rim_tint    rim_texture    clearcoat_enabled 
   clearcoat    clearcoat_roughness    clearcoat_texture    anisotropy_enabled    anisotropy    anisotropy_flowmap    ao_enabled    ao_light_affect    ao_texture 
   ao_on_uv2    ao_texture_channel    heightmap_enabled    heightmap_scale    heightmap_deep_parallax    heightmap_flip_tangent    heightmap_flip_binormal    heightmap_texture    heightmap_flip_texture    subsurf_scatter_enabled    subsurf_scatter_strength    subsurf_scatter_skin_mode    subsurf_scatter_texture &   subsurf_scatter_transmittance_enabled $   subsurf_scatter_transmittance_color &   subsurf_scatter_transmittance_texture $   subsurf_scatter_transmittance_depth $   subsurf_scatter_transmittance_boost    backlight_enabled 
   backlight    backlight_texture    refraction_enabled    refraction_scale    refraction_texture    refraction_texture_channel    detail_enabled    detail_mask    detail_blend_mode    detail_uv_layer    detail_albedo    detail_normal 
   uv1_scale    uv1_offset    uv1_triplanar    uv1_triplanar_sharpness    uv1_world_triplanar 
   uv2_scale    uv2_offset    uv2_triplanar    uv2_triplanar_sharpness    uv2_world_triplanar    texture_filter    texture_repeat    disable_receive_shadows    shadow_to_opacity    billboard_mode    billboard_keep_scale    grow    grow_amount    fixed_size    use_point_size    point_size    use_particle_trails    proximity_fade_enabled    proximity_fade_distance    msdf_pixel_range    msdf_outline_size    distance_fade_mode    distance_fade_min_distance    distance_fade_max_distance    script    lightmap_size_hint 	   material    custom_aabb    flip_faces    add_uv2    uv2_padding    size    subdivide_width    subdivide_depth    center_offset    orientation    custom_solver_bias    margin    data    backface_collision 
   min_value 
   max_value    bake_resolution    _data    point_count    interpolation_mode    interpolation_color_space    offsets    colors    sky_top_color    sky_horizon_color 
   sky_curve    sky_energy_multiplier 
   sky_cover    sky_cover_modulate    ground_bottom_color    ground_horizon_color    ground_curve    ground_energy_multiplier    sun_angle_max 
   sun_curve    use_debanding    sky_material    process_mode    radiance_size    background_mode    background_color    background_energy_multiplier    background_intensity    background_canvas_max_layer    background_camera_feed_id    sky    sky_custom_fov    sky_rotation    ambient_light_source    ambient_light_color    ambient_light_sky_contribution    ambient_light_energy    reflected_light_source    tonemap_mode    tonemap_exposure    tonemap_white    ssr_enabled    ssr_max_steps    ssr_fade_in    ssr_fade_out    ssr_depth_tolerance    ssao_enabled    ssao_radius    ssao_intensity    ssao_power    ssao_detail    ssao_horizon    ssao_sharpness    ssao_light_affect    ssao_ao_channel_affect    ssil_enabled    ssil_radius    ssil_intensity    ssil_sharpness    ssil_normal_rejection    sdfgi_enabled    sdfgi_use_occlusion    sdfgi_read_sky_light    sdfgi_bounce_feedback    sdfgi_cascades    sdfgi_min_cell_size    sdfgi_cascade0_distance    sdfgi_max_distance    sdfgi_y_scale    sdfgi_energy    sdfgi_normal_bias    sdfgi_probe_bias    glow_enabled    glow_levels/1    glow_levels/2    glow_levels/3    glow_levels/4    glow_levels/5    glow_levels/6    glow_levels/7    glow_normalized    glow_intensity    glow_strength 	   glow_mix    glow_bloom    glow_blend_mode    glow_hdr_threshold    glow_hdr_scale    glow_hdr_luminance_cap    glow_map_strength 	   glow_map    fog_enabled    fog_light_color    fog_light_energy    fog_sun_scatter    fog_density    fog_aerial_perspective    fog_sky_affect    fog_height    fog_height_density    volumetric_fog_enabled    volumetric_fog_density    volumetric_fog_albedo    volumetric_fog_emission    volumetric_fog_emission_energy    volumetric_fog_gi_inject    volumetric_fog_anisotropy    volumetric_fog_length    volumetric_fog_detail_spread    volumetric_fog_ambient_inject    volumetric_fog_sky_affect -   volumetric_fog_temporal_reprojection_enabled ,   volumetric_fog_temporal_reprojection_amount    adjustment_enabled    adjustment_brightness    adjustment_contrast    adjustment_saturation    adjustment_color_correction    subdivide_height 	   _bundled       PackedScene    res://Characters/player.tscn �s3��Drp   Script    res://Scripts/DayNigthCicle.gd ��������   !   local://StandardMaterial3D_8n6ss �         local://PlaneMesh_20ykp �      $   local://ConcavePolygonShape3D_oqtgs          local://Curve_kebmj }         local://Gradient_hdnhk [         local://Curve_pt5mh �         local://Gradient_qcbxn �         local://Gradient_h6gex �         local://Gradient_vhxk3 �         local://Gradient_fkoym Q      $   local://ProceduralSkyMaterial_ng3ni �         local://Sky_pvydb l         local://Environment_03tnw �         local://BoxMesh_tvtbw �         local://PackedScene_o0da8          StandardMaterial3D          ���=��	?���>  �?n      
   PlaneMesh    p             u   
      A   An         ConcavePolygonShape3D    |   #        �@      �@  ��      �@  �@      ��  ��      �@  ��      ��  �@      ��n         Curve    �         
   ��L>                                
   ���>�/�>                            
   �i6?�/�>                            
   ��L?                                �         n      	   Gradient    �   !          ���>333?  �?�   $        �?���>���>  �?  �?  �?  �?  �?  �?  �?  �?  �?  �?���>���>  �?n         Curve    �         
         �?                            
   ��L>                                
   ��L?                                
     �?  �?                            �         n      	   Gradient    �   !          �   $      j��=��^7{�?  �?n      	   Gradient    �   !      ���=0f�>���>�"?fff?�   $          ���=���>  �?��>k�>�Y?  �?g�?��"?�!=?  �?���>���>��?  �?    ���=���>  �?n      	   Gradient    �   !      �C>{؃>I��>+O�>��
?{�<?�BK?�   $          ���=���>  �?��n?��?���>  �?7Q?a�>?��?  �?x�F?M`?�9?  �?<?�U:?]�{?  �?��n?��?���>  �?    ���=���>  �?n      	   Gradient    �   !      	�><�>1��>�X#?>^X?�   $          �h >~�+>  �?�U3>gC�>e��>  �?�1�>˅&?��>  �?�+->x��>�d~>  �?    �h >~�+>  �?n         ProceduralSkyMaterial    �      ��X>��?��i?  �?�      ��?��[?�y?  �?�      ��d>���>���>  �?�      ��?��[?�y?  �?n         Sky    �         
   n         Environment    �         �            �         �         n         BoxMesh    u        �?�G�@  �?n         PackedScene    �      	         names "         Level    Node3D    Plane    mesh    MeshInstance3D    StaticBody3D    CollisionShape3D    shape    Player 
   transform 	   Camera3D    DayNigthCicle    script    sun_intensity 
   sun_color    moon_intensity    moon_color    sky_top_color    sky_horizon_color    ground_color    WorldEnvironment    environment    Sun    shadow_enabled    DirectionalLight3D    Moon 	   sky_mode    	   variants                                        �?              �?              �?    ԯ?         �?            �Uy?�$h>    �$h��Uy?    ;�@}+@                                                                     	                             �?            ��?��ż    ���<��?    �ߍ���(�               node_count             nodes     q   ��������       ����                      ����                           ����                     ����                     ���         	                  
   
   ����   	                        ����                              	      
                                ����                          ����                          ����                                 ����   	                      conn_count              conns               node_paths              editable_instances              version       n      RSRC               extends DirectionalLight3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	rotation_degrees.x = -(DayCicle.clock.x * 10)
            extends Camera3D

@export var mouse_sense : float = 0.3
@onready var pivot = $".."

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _input(event):
	if event is InputEventMouseMotion and Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		pivot.rotate_y(deg_to_rad(-event.relative.x * mouse_sense))
		rotate_x(deg_to_rad(-event.relative.y * mouse_sense))
		rotation_degrees.x = clamp(rotation_degrees.x, -60, 60)
	
	if event.is_action_pressed("esc"):
		if Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	if event.is_action_pressed("mouse_left"):
		if Input.mouse_mode == Input.MOUSE_MODE_VISIBLE:
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		
 extends Node
class_name DayCicleScript

var clock_run : bool = false
var clock : Vector4 = Vector4(0,0,0,0)
var clock_time : String
var timer : float = 0.0
var day_time : float

func _ready():
	start_day()
	
func _process(delta):
	if clock_run:
		clock.z += delta
	
		if clock.z >= 0.2:
			clock.y += 10
			clock.z = 0.0
		
		if clock.y >= 60:
			clock.x += 1
			clock.y = 00

		if clock.x == 24:
			clock.x = 0
		
	if clock.x == 3:
		end_day()
		
	day_time = clock.x / 24
	clock_time = "%02d:%02d" % [clock.x, clock.y]

func end_day():
	clock_run = false
	timer += get_process_delta_time()
	print(timer)
	if timer >= 5.0:
		timer = 0.0
		start_day()
		

func start_day():
	clock = Vector4(9, 0, 0, clock.w)
	clock.w += 1
	clock_run = true
            extends Node3D

@onready var sun : DirectionalLight3D = $Sun
@onready var moon : DirectionalLight3D = $Moon
@export var sun_intensity : Curve
@export var sun_color : Gradient

@export var moon_intensity : Curve
@export var moon_color : Gradient

@onready var environment = $WorldEnvironment as WorldEnvironment
@export var sky_top_color : Gradient
@export var sky_horizon_color : Gradient
@export var ground_color : Gradient

var time

func _ready():
	pass
	
func _process(delta):
	time = DayCicle.day_time
	sun.rotation_degrees.x = (time * 360 ) + 90
	sun.light_color = sun_color.sample(time)
	sun.light_energy = sun_intensity.sample(time)
	
	moon.rotation_degrees.x = (time * 360 ) + 270
	moon.light_color = moon_color.sample(time)
	moon.light_energy = moon_intensity.sample(time)
	
	sun.visible = sun.light_energy > 0
	moon.visible = moon.light_energy > 0
	
	environment.environment.sky.sky_material.set("sky_top_color", sky_top_color.sample(time))
	environment.environment.sky.sky_material.set("sky_horizon_color", sky_horizon_color.sample(time))
	environment.environment.sky.sky_material.set("ground_bottom_color", ground_color.sample(time))
	environment.environment.sky.sky_material.set("ground_horizon_color", sky_horizon_color.sample(time))
               GST2   �   �     �����                � �               ���)TUUU� I�$I�  &!UUUU� I    &!UUUU�z�       &!UUUU�         &!UUUU�         &!UUUU�         &!UUUU�         &!UUUU�         &!UUUU�         &!UUUU�         &!UUUU�         &!UUUU�         &!UUUU�         &!UUUU�         &!UUUU�         &!UUUU�         &!UUUU�         &!UUUU�         &!UUUU�         &!UUUU�         &!UUUU�         &!UUUU�         &!UUUU�         &!UUUU�         &!UUUU�         &!UUUU�         &!UUUU�         &!UUUU�zX      &!UUUU� O9    &!UUUU� I�$O'  &!UUUU        ���)UUU� I�$I�  &!UUUU�!@    F!&!UUU�       �1&!U5	 �       �1g!   �         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�       �1g!p   �       �1&!U\` � �   F!&!UUUT� I�$N�'  &!UUUU� �p   &!UUUU�       �1&!%�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�       �1&!TXp@� X8��G)&!��U�zP     &!UUUU�       �1g!  �         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�       �1g)@�� �x � @  &!UUUU�         &!UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         &!UUUU�         &!UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�       �:�1UUU�       WD2UU5�       WD2U  �       WD2k@  �       �:�1UUUT�         �1UUUU�         �1UUUU�       �:�1UUU�       WD2� �       WD2U�  �       WD2UUX��       �:�1UUUT�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         &!UUUU�         &!UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�       WD2�         wDUUUU�         wDUUUU�         wDUUUU�       WD2T\Pp�         �1UUUU�         �1UUUU�       WD25�         wDUUUU�         wDUUUU�         wDUUUU�       WD2PPPP�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         &!UUUU�         &!UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�       WD2%%%�         wDUUUU�         wDUUUU�         wDUUUU�       WD2@   �       WD+:U   �       WD+:U   �       WD2   �         wDUUUU�         wDUUUU�         wDUUUU�       WD2PPXX�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         &!UUUU�         &!UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�       WD2555	�         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�       WD2\\\`�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         &!UUUU�         &!UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�       6D2UU��       WD2]�  �       WD2UUX��       m:�1UUU�       WD2�% �       wDD   �         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�       wDD@   �       WD2WX@ �       �:�1UUUT�       WD2UU%�       WD2u�  �       6D2UUWT�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         &!UUUU�         &!UUUU�         �1UUUU�         �1UUUU�         �1UUUU�       m:�1UUU�       WD2 �         wDUUUU�         wDUUUU�       WL�:   �         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�       WDm:�   �         wDUUUU�         wDUUUU�       WD2P@� �       �:�1UUUT�         �1UUUU�         �1UUUU�         �1UUUU�         &!UUUU�         &!UUUU�         �1UUUU�         �1UUUU�         �1UUUU�       WD2%	�         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�       WD2TXp`�         �1UUUU�         �1UUUU�         �1UUUU�         &!UUUU�         &!UUUU�         �1UUUU�         �1UUUU�         �1UUUU�       WD25�U�       wDD   �         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�       wDD   @�       WD2P\VU�         �1UUUU�         �1UUUU�         �1UUUU�         &!UUUU�         &!UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�       WD2�         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�       WD2@pPT�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         &!UUUU�         &!UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�       WD2�         wDUUUU�         wDUUUU�       ��xLUUU�       ���TU% �       ���u   �       ���TW`  �       ���TUUW\�         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�       ���TUU�5�       ���T�	  �       ���}   �       ���TUX� �       ��xLUUUT�         wDUUUU�         wDUUUU�       WD2TTTT�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         &!UUUU�         &!UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�       WD2�         wDUUUU�         wDUUUU�       ���T%�       ��IJ �`P�       Y�IJ\UUU�       ��IJ�UU�       ���Sp@���         wDUUUU�         wDUUUU�       ���TU�	�       ���TUWP`�         wDUUUU�         wDUUUU�       ��T	C�       ��IJpVUU�       8�IJ5UUU�       ��IJ �       ���TTXPp�         wDUUUU�         wDUUUU�       WD2TTTT�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         &!UUUU�         &!UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�       WD2�         wDUUUU�         wDUUUU�       ���T	�       ��IJX\\X�         BUUUU�         BUUUU�       ��IJ�����         wDUUUU�         wDUUUU�       ���T�       ���T@@@@�         wDUUUU�         wDUUUU�       ��IJBBBB�         BUUUU�         BUUUU�       ��IJ%555�       ���T```p�         wDUUUU�         wDUUUU�       WD2TTTT�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         &!UUUU�         &!UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�       WD2�         wDUUUU�         wDUUUU�       ���T%U�       ��IJPp� �       ׽IJUUU\�       ��IJUU��       ��nS�����         wDUUUU�         wDUUUU�       ���T�       ���T@@@@�         wDUUUU�         wDUUUU�       ���SC	5�       ��IJUUVp�       ��)JUUU5�       ��IJ �       ���TPXTW�         wDUUUU�         wDUUUU�       WD2TTTT�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         &!UUUU�         &!UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�       WD2�         wDUUUU�         wDUUUU�         wDUUUU�       ���T%UU�       ���T  �U�       ���T `WU�       9uxLTUUU�         wDUUUU�         wDUUUU�       ���T	��       ���T@@pW�         wDUUUU�         wDUUUU�       9mwLUUU�       ���T 	�U�       ���T  �U�       ���T�XUU�         wDUUUU�         wDUUUU�         wDUUUU�       WD2TTTT�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         &!UUUU�         &!UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�       WD2�         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�       WD2TTTT�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         &!UUUU�         &!UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�       ��KB��       ��8uU  �       ���TU   �       ���TU�  �       ���TU_� �         wDUUUU�         wDUUUU�         wDUUUU�       \��LUUU�       ϘTUUU �       ϘTUUU �       ϘTUUU �       ϘTUUU �       |��LUUUT�         wDUUUU�         wDUUUU�         wDUUUU�       ���TU� �       ���TU*  �       ���TU   �       ��8uU  ��       ��KBVTTT�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         &!UUUU�         &!UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�       WD2�       xLwDUUU�       ��xLUUU�       �ƘLUUU�       ��z} �       �LwDUUUT�         wDUUUU�         wDUUUU�       ���T%�       ���T  �\�       ���T  �U�       ���T  �U�       ���T  *5�       ���TXPPP�         wDUUUU�         wDUUUU�       wLwDUUUU�       ����@@@�       �ƘL�UUU�       ��xL�UUU�       xLwDTUUU�       WD2TTTT�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         &!UUUU�         &!UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�       7D2���         wDUUUU�         wDUUUU�         wDUUUU�       ���T�       ���TUU  �       ���TUU� �       ���TUU� �       ���T �       ���TTTTV�         wDUUUU�         wDUUUU�       ���T��       ���TPp` �       ���TUU� �       ���TUU* �       ���TUU  �       ���T@@@@�         wDUUUU�         wDUUUU�         wDUUUU�       6D2TTVW�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         &!UUUU�         &!UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�       L:�1UUU�       WD2 �         wDUUUU�         wDUUUU�       ���TUUU�       ���T �UU�       ���T �UU�       ���T  UU�       ���T  UU�       \�xLTWUU�         wDUUUU�         wDUUUU�       �xL�UU�       ���T  UU�       ���T  UU�       ���T �UU�       ���T UU�       ���T`UUU�         wDUUUU�         wDUUUU�       WD2 �@p�       +:�1TUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         &!UUUU�         &!UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�       WD2%�UU�       WD:  	�         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�       WD2  �p�       WD2XVUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         &!UUUU�         &!UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�       D25UUU�       WD2 %U�       WDQ;   �         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�       WD1;   `�       WD2 �XU�       �C
2\UUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         &!UUUU�         &!UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�       RC
25UUU�       WD2 -UU�       WD2  -U�       WD,:   ��       WL�C   -�         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�       WL�C   x�       WD+:   _�       WD2  xU�       WD2 xUU�       RC
2\UUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         &!UUUU�         &!UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�       
2�1UUU�       �:�1
UUU�       �:�1UUU�       �:�1�UUU�       �:�1�UUU�       
2�1TUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         &!UUUU�z 0    &!UUUU�       �1g!  �         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�       �1g) ��@�x  ` 
   &!UUUU� 1�  &!UUUU�       �1&!%�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�       �1&!@pXT�  (��%G)&!��� ɑ�I�$  &!UUUU�   �F!&!UUU�       �1&! 	5U�       �1g)   )�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�       �1g)   h�       �1&! `\U�    
4F!&!TUUU� x�$I�$  &!UUUU        ���)UUUT� ���I�$  &!UUUU�  0 ���G)&!UU]�x    �N  &!UUUU�         &!UUUU�         &!UUUU�         &!UUUU�         &!UUUU�         &!UUUU�         &!UUUU�         &!UUUU�         &!UUUU�         &!UUUU�         &!UUUU�         &!UUUU�         &!UUUU�         &!UUUU�         &!UUUU�         &!UUUU�         &!UUUU�         &!UUUU�         &!UUUU�         &!UUUU�         &!UUUU�         &!UUUU�         &!UUUU�         &!UUUU�         &!UUUU�x    �5  &!UUUU�   `��$G)&!UUu�� p�$I�$  &!UUUU        ���)UUU� I��	�RF!TUUU��     �1&!UU-�       �1&!UU  �       �1&!UU  �       �1&!UU  �       �1&!UU  �       �1&!UU  �       �1&!UU  �       �1&!UU  �       �1&!UU  �       �1&!UU  �       �1&!UU  �       �1&!UU  �       �1&!UU  �P    �1&!UUx�� I�$`8�RF!UUU�P   �1&!�5%�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU� �  �1&!V\XP�       �1&!�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�       �C
2UUU%�       WD2UU� �       +:�1UUUT�       :�1UUU�       WD2UUs �       �C
2UUUX�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�       �1&!PPPP�       �1&!�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�       WD2�         wDUUUU�       WD2VT� �       WD2�* �         wDUUUU�       WD2@@@@�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�       �1&!PPPP�       �1&!�         �1UUUU�       �:�1UUU�       WD2UU_��       WD2UU�%�       WD2	  �         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�       WD2`@  �       WD2UUWX�       WD2UU��       �:�1UUUT�         �1UUUU�       �1&!PPPP�       �1&!�         �1UUUU�       WD2	�         wDUUUU�       WD�C   �         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�       WD�Cp   �         wDUUUU�       WD2\P`@�         �1UUUU�       �1&!PPPP�       �1&!�         �1UUUU�       WD25��         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�       WD2@P\V�         �1UUUU�       �1&!PPPP�       �1&!�         �1UUUU�       1C�1�         wDUUUU�       ��,S�C�       ��IJ� �U�       ���TUWTZ�       ��TUUU�       ���TUUUT�       ���TU���       ��IJ �U�       ��S�����         wDUUUU�       QC�1TTTT�         �1UUUU�       �1&!PPPP�       �1&!�         �1UUUU�       1C�1�         wDUUUU�       ��IJbcC�       ��)JUUU�       גTQQXT�       ���T5555�       ���T\\\\�       ϓL��%�       ��)JUUU��       ��IJ�����         wDUUUU�       QC�1TTTT�         �1UUUU�       �1&!PPPP�       �1&!�         �1UUUU�       1C�1�         wDUUUU�       ^ߘT5UUU�       ���T�UUU�       �TwDTUUU�       ���T5�UU�       ���T\VUU�       �TwDUUU�       ���TUUU�       ~�T\UUU�         wDUUUU�       QC�1TTTT�         �1UUUU�       �1&!PPPP�       �1&!�         �1UUUU�       ��
:���       ���T� UU�       ���T_ %�       xLwDUUUT�       ���TUU�       ���TU� ��       ���TU� ��       ���TUUTT�         wDUUUU�       ���T� �X�       ���T� UU�       Ք
:TTWW�         �1UUUU�       �1&!PPPP�       �1&!�         �1UUUU�       ;�1�UU�       WD�:   �       ���T%5�U�       ���TU 
U�       ���T* U�       \�xLTVWU�       ;�xL��U�       ���TT� U�       ���TU �U�       ���TXXVU�       WD�:   @�       �:�1TVUU�         �1UUUU�       �1&!PPPP�       �1&!�         �1UUUU�         �1UUUU�       WD2	%�U�       WD+:   �         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�         wDUUUU�       WD:   p�       WD2`XWU�         �1UUUU�         �1UUUU�       �1&!PPPP�       �1&!�         �1UUUU�         �1UUUU�         �1UUUU�       m:�1UUU�       WD2�UU�       WD2 
UU�       WD2  UU�       WD2  UU�       WD2 �UU�       WD2�WUU�       m:�1TUUU�         �1UUUU�         �1UUUU�         �1UUUU�       �1&!PPPP�    �1&!%5��         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�         �1UUUU�  @ 
 �1&!PX\V� 1�I�$�RF!UUUT�    �
�1&!-UU�       �1&!  UU�       �1&!  UU�       �1&!  UU�       �1&!  UU�       �1&!  UU�       �1&!  UU�       �1&!  UU�       �1&!  UU�       �1&!  UU�       �1&!  UU�       �1&!  UU�       �1&!  UU�     5�1&!�xUU� �&N�$�RF!UUU� 	   �1&!V5�       �1&!U   �       �1&!U   �       �1&!U   �       �1&!U   �       �1&!U   �       �1&!U   � `   �1&!�\p@�       �1&!�         �1UUUU�       WD2U�55�       WD2URp �       WD2U� �       WD2UW\\�         �1UUUU�       �1&!@@@@�       �1&!�       WD2U��       WD25	  �         wDUUUU�         wDUUUU�       WD2\`  �       WD2U[@��       �1&!@@@@�       �1&!�       WD2	�       ]��R��R�       |��LUUU��       |��LUUU�       ]��R�����       WD2@`pp�       �1&!@@@@�       �1&!�       WD2�       [�IJ\R��       �ƘL�U�       �ΘL��VU�       [�IJ5����       WD2pppp�       �1&!@@@@�       �1&!�       ��+B����       ^ߘTXQ���       �ΘL�	sZ�       �ΘL_`ͥ�       ^ߘT%EK_�       ��+Bp___�       �1&!@@@@�       �1&!�       D2UUU�       WD2 �U�       WD2   U�       WD2   U�       WD2 �^U�       �C2TUUU�       �1&!@@@@�  @ ��1&!5V�       �1&!   U�       �1&!   U�       �1&!   U�       �1&!   U�       �1&!   U�       �1&!   U�   ��&�1&!@p\��D     �1F!��       7D�)UUu��       7D�)UU]B�D�@   �1F!_@���       7D�)�%%5�       ��m:�����       ��m:z��
�       7D�)WXX\�       ���1����       ;��J$�,��       ;��J�8��       ���1VVTV�D   �:G!)��U�       7D�) �UU�       7D�) zUU�C    (�:g)hjjU��     �l�1U�-	��     �l�1U_x`��     Y}�1-	�U��      Y}�1x`^U��   �t�1UA�}�       C�:U   �         �BUUUU            [remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://5ubfjn37uri"
path.s3tc="res://.godot/imported/icon.svg-218a8f2b3041327d8a5756f3a245f83b.s3tc.ctex"
metadata={
"imported_formats": ["s3tc_bptc"],
"vram_texture": true
}
      [remap]

path="res://.godot/exported/133200997/export-542050d87c78dec139c7fa1f77e82d13-player.scn"
             [remap]

path="res://.godot/exported/133200997/export-aa8524b3965874fe19b6f51335dfb48f-level.scn"
              list=Array[Dictionary]([{
"base": &"Node",
"class": &"DayCicleScript",
"icon": "",
"language": &"GDScript",
"path": "res://Scripts/DayCicle.gd"
}])
            <svg height="128" width="128" xmlns="http://www.w3.org/2000/svg"><rect x="2" y="2" width="124" height="124" rx="14" fill="#363d52" stroke="#212532" stroke-width="4"/><g transform="scale(.101) translate(122 122)"><g fill="#fff"><path d="M105 673v33q407 354 814 0v-33z"/><path fill="#478cbf" d="m105 673 152 14q12 1 15 14l4 67 132 10 8-61q2-11 15-15h162q13 4 15 15l8 61 132-10 4-67q3-13 15-14l152-14V427q30-39 56-81-35-59-83-108-43 20-82 47-40-37-88-64 7-51 8-102-59-28-123-42-26 43-46 89-49-7-98 0-20-46-46-89-64 14-123 42 1 51 8 102-48 27-88 64-39-27-82-47-48 49-83 108 26 42 56 81zm0 33v39c0 276 813 276 813 0v-39l-134 12-5 69q-2 10-14 13l-162 11q-12 0-16-11l-10-65H447l-10 65q-4 11-16 11l-162-11q-12-3-14-13l-5-69z"/><path d="M483 600c3 34 55 34 58 0v-86c-3-34-55-34-58 0z"/><circle cx="725" cy="526" r="90"/><circle cx="299" cy="526" r="90"/></g><g fill="#414042"><circle cx="307" cy="532" r="60"/><circle cx="717" cy="532" r="60"/></g></g></svg>
             �s3��Drp   res://Characters/player.tscn3 cL&h   res://Levels/level.tscn��X�    res://icon.svg       res://addons/godot-jolt/godot-jolt.gdextension
 ECFG      application/config/name         Behind-door-project    application/run/main_scene          res://Levels/level.tscn    application/config/features$   "         4.2    Forward Plus       application/config/icon         res://icon.svg     autoload/DayCicle$         *res://Scripts/DayCicle.gd     input/up�              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device     ����	   window_id             alt_pressed           shift_pressed             ctrl_pressed          meta_pressed          pressed           keycode           physical_keycode   W   	   key_label             unicode    w      echo          script      
   input/down�              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device     ����	   window_id             alt_pressed           shift_pressed             ctrl_pressed          meta_pressed          pressed           keycode           physical_keycode   S   	   key_label             unicode    s      echo          script      
   input/left�              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device     ����	   window_id             alt_pressed           shift_pressed             ctrl_pressed          meta_pressed          pressed           keycode           physical_keycode   A   	   key_label             unicode    a      echo          script         input/right�              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device     ����	   window_id             alt_pressed           shift_pressed             ctrl_pressed          meta_pressed          pressed           keycode           physical_keycode   D   	   key_label             unicode    d      echo          script      	   input/esc�              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device     ����	   window_id             alt_pressed           shift_pressed             ctrl_pressed          meta_pressed          pressed           keycode           physical_keycode    @ 	   key_label             unicode           echo          script         input/mouse_left�              deadzone      ?      events              InputEventMouseButton         resource_local_to_scene           resource_name             device     ����	   window_id             alt_pressed           shift_pressed             ctrl_pressed          meta_pressed          button_mask           position              global_position               factor       �?   button_index         canceled          pressed           double_click          script      
   input/jump�              events              InputEventKey         resource_local_to_scene           resource_name             device     ����	   window_id             alt_pressed           shift_pressed             ctrl_pressed          meta_pressed          pressed           keycode           physical_keycode       	   key_label             unicode           echo          script            deadzone      ?	   input/run�              events              InputEventKey         resource_local_to_scene           resource_name             device     ����	   window_id             alt_pressed           shift_pressed             ctrl_pressed          meta_pressed          pressed           keycode           physical_keycode    @ 	   key_label             unicode           echo          script            deadzone      ?   physics/3d/physics_engine         JoltPhysics3D   