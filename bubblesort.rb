def bubble_sort(arr)
  n = arr.length
  (0...n).each do |i|
    (0...n - i - 1).each do |j|
      arr[j], arr[j + 1] = arr[j + 1], arr[j] if arr[j] > arr[j + 1]
    end
  end

  arr # Return the sorted array
end

bubble_sort([4, 3, 78, 2, 0, 2])
