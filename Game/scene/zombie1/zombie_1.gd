extends CharacterBody2D # 1. Тепер скрипт відповідає типу вузла

@export var max_speed = 80.0
var player: Node2D = null

func _ready() -> void:
	# Знаходимо гравця один раз при завантаженні зомбі.
	# Це економить ресурси твого процесора i3-330M.
	player = get_tree().get_first_node_in_group("player") as Node2D

func _physics_process(_delta: float) -> void:
	# Перевіряємо, чи гравець існує в сцені
	if player != null:
		# Розраховуємо напрямок
		var direction = (player.global_position - global_position).normalized()
		
		# Встановлюємо швидкість
		velocity = direction * max_speed
		
		# Викликаємо рух
		move_and_slide()
	else:
		# Якщо гравець зник, зупиняємо зомбі
		velocity = Vector2.ZERO
