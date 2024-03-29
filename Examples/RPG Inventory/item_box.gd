extends Zone


enum Location {ARM, CHEST, HEAD, OTHER}


@export (Location) var type = Location.OTHER


func piece_added(piece, location = null):
	super.piece_added(piece, location)
	piece.position = position


func can_accept_piece(piece):
	if type == Location.OTHER:
		return pieces.is_empty()
	else:
		return pieces.is_empty() and piece.type == type
