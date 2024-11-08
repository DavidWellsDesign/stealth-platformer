extends CollisionShape2D

@export var attack_power = 10

func _on_sword_point_body_entered(body):
	if body.is_in_group("Enemies"):
		body.take_damage(attack_power)
