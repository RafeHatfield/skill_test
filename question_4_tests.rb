require 'colorize'
require './question_4.rb'

@csv_manager = CsvManager.new
@shape = Shape.new("Shape")
@polygon = Polygon.new("Heptagon", 2, 7)
@square = Square.new(4)
@pentagon = Pentagon.new(4)
@triangle = Triangle.new(4)
@circle = Circle.new(4)
@valid_csv = "./shapes.csv"
@invalid_shapes_filepath = "./invalid_shapes.csv"
@invalid_numbers_filepath = "./invalid_number.csv"

def passed_test
  puts "PASSED".green
end

def failed_test
  puts "FAILED".red
end

def test_for_invalid_shape_in_csv
  puts "Test that an invalid shape in the csv will raise the right error message: "
  expected_error_message = "Invalid CSV error! Please check your file content. sausage is an invalid shape."
  begin
    @csv_manager.process_csv(@invalid_shapes_filepath)
  rescue => error
    error.message == expected_error_message ? passed_test : failed_test
  end
end

def test_for_invalid_number_in_csv
  puts "Test that an invalid number in the csv will raise the right error message: "
  expected_error_message = "Invalid CSV error! Please check your file content. blue is not a number."
  begin
    @csv_manager.process_csv(@invalid_numbers_filepath)
  rescue => error
    error.message == expected_error_message ? passed_test : failed_test
  end
end

def test_for_processed_csv
  puts "Test that given a file path, the CSV Manager will return an array of Shape Objects: "
  @csv_manager.process_csv(@valid_csv)
  shapes = @csv_manager.shapes_array
  shapes.all?{|shape| shape.is_a?(Shape)} ? passed_test : failed_test
end

def test_for_invalid_shape
  puts "Tests that a shape without a name will raise an error: "
  expected_error_message = "wrong number of arguments (given 0, expected 1)"
  begin
    shape = Shape.new()
  rescue => error
    error.message == expected_error_message ? passed_test : failed_test
  end
end

def test_for_shape_created
  puts "Test that a valid shape has been created: "
  @shape.is_a?(Shape) ? passed_test : failed_test
end

def test_that_a_shape_has_a_name
  expected_name = "Shape"
  puts "Test that a shape has a name of Shape: "
  @shape.name == expected_name ? passed_test : failed_test
end

def test_for_invalid_polygon
  puts "Tests that a polygon without attributes will raise an error: "
  expected_error_message = "wrong number of arguments (given 0, expected 3)"
  begin
    polygon = Polygon.new()
  rescue => error
    error.message == expected_error_message ? passed_test : failed_test
  end
end

def test_for_polygon_created
  puts "Test that a valid polygon has been created: "
  @polygon.is_a?(Polygon) ? passed_test : failed_test
end

def test_that_a_polygon_is_a_shape
  puts "Test that the polygon is a shape: "
  @polygon.is_a?(Shape) ? passed_test : failed_test
end

def test_that_a_polygon_has_a_name
  expected_name = "Heptagon"
  puts "Test that the polygon has a name of Heptagon: "
  @polygon.name == expected_name ? passed_test : failed_test
end

def test_that_a_polygon_has_a_side_length
  expected_length = 2
  puts "Test that the polygon has side length of 2: "
  @polygon.side_length == expected_length ? passed_test : failed_test
end

def test_that_a_polygon_has_number_of_sides
  expected_sides = 7
  puts "Test that the polygon has 7 sides: "
  @polygon.number_of_sides == expected_sides ? passed_test : failed_test
end

def test_that_a_polygon_has_an_area
  expected_area = 14.54
  puts "Test that the polygon has an area of 14.54: "
  @polygon.calculate_area.round(2) == expected_area ? passed_test : failed_test
end

def test_that_a_polygon_has_a_perimiter
  expected_perimiter = 14
  puts "Test that the polygon has a perimiter of 14: "
  @polygon.calculate_perimiter.round(2)  == expected_perimiter ? passed_test : failed_test
end

def test_that_a_square_is_a_shape
  puts "Test that a square is a shape: "
  @square.is_a?(Shape) ? passed_test : failed_test
end

def test_that_a_square_is_a_polygon
  puts "Test that a square is a polygon: "
  @square.is_a?(Polygon) ? passed_test : failed_test
end

def test_that_a_triangle_is_a_shape
  puts "Test that a triangle is a shape: "
  @triangle.is_a?(Shape) ? passed_test : failed_test
end

def test_that_a_triangle_is_a_polygon
  puts "Test that a triangle is a polygon: "
  @triangle.is_a?(Polygon) ? passed_test : failed_test
end

def test_that_a_pentagon_is_a_shape
  puts "Test that a pentagon is a shape: "
  @pentagon.is_a?(Shape) ? passed_test : failed_test
end

def test_that_a_pentagon_is_a_polygon
  puts "Test that a pentagon is a polygon: "
  @pentagon.is_a?(Polygon) ? passed_test : failed_test
end

def test_that_a_circle_is_a_shape
  puts "Test that a circle is a shape: "
  @circle.is_a?(Shape) ? passed_test : failed_test
end

def test_that_a_circle_is_not_a_polygon
  puts "Test that a circle is not a polygon: "
  @circle.is_a?(Polygon) ? failed_test : passed_test
end

test_for_invalid_shape_in_csv
test_for_invalid_number_in_csv
test_for_processed_csv
test_for_invalid_shape
test_for_shape_created
test_that_a_shape_has_a_name
test_for_invalid_polygon
test_for_polygon_created
test_that_a_polygon_is_a_shape
test_that_a_polygon_has_a_name
test_that_a_polygon_has_a_side_length
test_that_a_polygon_has_number_of_sides
test_that_a_polygon_has_an_area
test_that_a_polygon_has_a_perimiter
test_that_a_square_is_a_shape
test_that_a_square_is_a_polygon
test_that_a_triangle_is_a_shape
test_that_a_triangle_is_a_polygon
test_that_a_pentagon_is_a_shape
test_that_a_pentagon_is_a_polygon
test_that_a_circle_is_a_shape
test_that_a_circle_is_not_a_polygon