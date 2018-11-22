class ArrayRotator

  def rotate(array, k)
    k %= array.length
    storage = array.slice!(0, k) #we get first k elements from the array
    array.push(storage) #and simply bring them backwards
  end

end



