extends Zone2D


enum Location {ARM, CHEST, HEAD, OTHER}


@export var type := Location.OTHER


func piece_added(piece, location = null):
  #super.piece_added(piece, location)
  super.piece_added(piece)
  piece.position = position


func can_accept_piece(piece):
  if type == Location.OTHER:
    return pieces.is_empty()
  else:
    return pieces.is_empty() and piece.type == type
