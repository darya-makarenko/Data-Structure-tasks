class ArrayRotator

  def rotate_by_parts(array, k)
    k %= array.length
    storage = array.pop(k) #we get lastt k elements from the array
    array.unshift(storage) #and simply bring them to front
  end

  def rotate_by_cycle(array, k)
    k %= array.length
    k.times do 
      array.unshift(array.pop) #continuous moving last element to the first position
    end
  end

end



