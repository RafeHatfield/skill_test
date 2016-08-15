def xml_parser(str)
  arr_xml = str.scan(/<{1}\/?\d+>{1}/)

  number_of_tags = arr_xml.length

  if invalid_string_input?(arr_xml, str) || invalid_xml_content?(arr_xml, number_of_tags)
    raise "Invalid XML Error!"
  else
    print_xml(arr_xml, number_of_tags)
  end
end

def print_xml(arr_xml, number_of_tags)
  arr_xml.each do |i|
    if number_of_tags > (arr_xml.length / 2)
      puts return_tag(i.to_s, (arr_xml.length - number_of_tags))
    else
      puts return_tag(i.to_s, (number_of_tags - 1))
    end
    number_of_tags -= 1
  end
end

def return_tag(tag_content, spacing)
  return ' ' * spacing + tag_content + "\n"
end

def invalid_string_input?(arr_xml, string_xml)
  if arr_xml.join != string_xml
    puts "invalid string"
    return true
  end
end

def invalid_xml_content?(arr_xml, number_of_tags)
  opening_tag_arr = arr_xml[0..number_of_tags/2 -1]

  closing_tag_arr = arr_xml[number_of_tags/2..number_of_tags-1].reverse
  
  case 
  when opening_tag_arr.length != closing_tag_arr.length
    puts "amount of opening and closing tags do not add up"
    return true
  when check_for_opening(closing_tag_arr)
    puts "invalid location for opening tag"
    return true
  when check_for_closing(opening_tag_arr)
    puts "invalid location for closing tag"
    return true
  when check_for_mismatching_open_close_tags(closing_tag_arr, opening_tag_arr)
    puts "the  closing and opening tags do not match up"
    return true
  end
end

def check_for_mismatching_open_close_tags(closing_tags, opening_tags)
  return closing_tags.map{|tag| tag.match(/\d/)[0]} != opening_tags.map{|tag| tag.match(/\d/)[0]}
end

def check_for_opening(arr)
  return arr.any? {|tag| is_opening_tag?(tag.to_s)}
end

def check_for_closing(arr)
  return arr.any? {|tag| is_closing_tag?(tag.to_s)}
end

def is_opening_tag?(tag)
  return tag.index(/<{1}\d+>{1}/) == 0
end

def is_closing_tag?(tag)
  return tag.index(/<{1}\/\d+>{1}/) == 0
end

def convert_opening_to_closing(tag)
  return tag.sub(/<{1}/, "</")
end

string = "<1><2><3><4><5><6></6></5></4></3></2></1>"

xml_parser(string)

