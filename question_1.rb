# this takes an array and the starting length of the array
def recursive_printer(arr, n = arr.length)
  arr_length = arr.length

  if n.abs <= arr_length
    if n > 0
      puts return_tag(arr[arr_length - n].to_s, (arr_length - n).to_i, true)
    elsif n < 0
      puts return_tag(arr[n].to_s, (arr_length + n).to_i, false)
    end
    recursive_printer(arr, n-1)
  else
    return "This is nil!"
  end
end

def return_tag(tag_content, spacing, isOpeningTag)
  isOpeningTag ? first_tag = "<" : first_tag = "</" 

  return ' ' * spacing + first_tag + tag_content + ">" + "\n" 
end

array = [1,2,3,4,5,6]

recursive_printer(array)