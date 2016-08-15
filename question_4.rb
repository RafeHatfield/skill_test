require 'csv'

class Shape
  attr_reader :name

  def initialize(name)
    @name = name
  end

  private
  def shape_string(side_type, side_length, perimiter, area)
    return "is a " + @name + ", with a " + side_type + " of " + side_length + ", having a perimiter of " + perimiter + " and an area of " + area + " units square."
  end
end

#assume all polygons are regular polygons
class Polygon < Shape
  attr_reader :side_length, :number_of_sides

  def initialize(name, side_length, number_of_sides)
    @side_length = side_length.to_i
    @number_of_sides = number_of_sides.to_i
    super name
  end

  def calculate_perimiter
    @side_length.to_i * @number_of_sides
  end

  def calculate_apothem
    @side_length / (2 *  Math.tan(3.14159/@number_of_sides))
  end

  def calculate_area 
    (calculate_perimiter * calculate_apothem)/2
  end

  def to_string
    shape_string("side length", @side_length.to_s, calculate_perimiter.round(2).to_s, calculate_area.round(2).to_s)
  end
end

class Pentagon < Polygon

  def initialize(side_length)
    super("pentagon", side_length, 5)
  end
end

class Triangle < Polygon

  def initialize(side_length)
    super("triangle", side_length, 3)
  end
end

class Square < Polygon

  def initialize(side_length)
    super("square", side_length, 4)
  end
end

class Circle < Shape

  attr_reader :radius

  def initialize(radius)
    @radius = radius.to_i
    super "circle"
  end

  def calculate_perimiter
    2 * Math::PI * @radius
  end 

  def calculate_area
    Math::PI * (@radius * @radius)
  end 

  def to_string
    shape_string("radius", @radius.to_s, calculate_perimiter.round(2).to_s, calculate_area.round(2).to_s)
  end
end

class CsvManager

  attr_reader :shapes_array

  def process_csv(csv_file_path)
    @shapes_array = []

    CSV.foreach(csv_file_path) do |row|
      @shapes_array.push(create_shape_objects(row[0], row[1]))
    end
  end

  def print_procesed_content
    @shapes_array.each_with_index{|shape, index| puts "Shape " + (index + 1).to_s + " "+ shape.to_string}
  end

  private

  def create_shape_objects(shape, side_length)
    if side_length.to_i == 0
      raise "Invalid CSV error! Please check your file content. " + side_length + " is not a number."
    end

    case shape
    when "square"
      Square.new(side_length)
    when "circle"
      Circle.new(side_length)
    when "pentagon"
      Pentagon.new(side_length)
    when "triangle"
      Triangle.new(side_length)
    else
      raise "Invalid CSV error! Please check your file content. " + shape + " is an invalid shape."
    end
  end  
end

csv_manager = CsvManager.new
csv_manager.process_csv("./csv_files/shapes.csv")
csv_manager.print_procesed_content