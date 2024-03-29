@tool
extends Node2D


@export_range(1, 1000000) var columns:int = 1: set = columns_set
@export_range(1, 1000000) var rows:int = 1: set = rows_set
@export var cell_size:Vector2 = Vector2(16, 16): set = cell_size_set
@export var cell_margin:Vector2 = Vector2(2, 2): set = cell_margin_set
@export var color:Color = Color.WHITE: set = color_set
var bounds = SquareGridBounds.new(Vector2())
var points = PackedVector2Array()


func _ready():
  pass

func update() -> void:
  queue_redraw()

func _draw():
  if Engine.is_editor_hint():
    for point in points:
      var corner = Vector2(point.x - (cell_size.x/2.0), point.y - (cell_size.y/2.0))
      draw_rect(Rect2(corner, cell_size), color)


func _generate_grid():
  bounds = SquareGridBounds.new(Vector2(columns, rows))

  var width = (cell_size.x * columns) + (cell_margin.x * columns)
  var height = (cell_size.y * rows) + (cell_margin.y * rows)
  var column_width = float(width) / columns
  var column_height = float(height) / rows
  points = PackedVector2Array()
  for i in range(0, rows):
    for j in range(0, columns):
      var x = ((-width + column_width)  / 2.0) + (j * column_width)
      var y = ((-height + column_height)  / 2.0) + (i * column_height)
      points.append(Vector2(x, y))
  update()


func get_bounds():
  return bounds


func cell_size_set(value):
  cell_size = value
  _generate_grid()


func cell_margin_set(value):
  cell_margin = value
  _generate_grid()


func columns_set(value):
  columns = value
  _generate_grid()


func rows_set(value):
  rows = value
  _generate_grid()

func color_set(value):
  color = value
  update()
