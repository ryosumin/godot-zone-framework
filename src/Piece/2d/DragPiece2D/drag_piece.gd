class_name DragPiece2D

extends Piece2D


var overlap_zone: Object


func _ready():
	$OverlapDetector2D.connect("overlap_changed", self, "_on_overlap_changed")
	$DragMovement2D.connect("picked_up", self, "_on_picked_up")
	$DragMovement2D.connect("put_down", self, "_on_put_down")


func _on_overlap_changed(from, to):
	overlap_zone = to


# Called when piece is picked up
func _on_picked_up():
	pass


# Called when piece is put down
func _on_put_down():
	pass
