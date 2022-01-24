def bubble_sort(nums)
    length = nums.length 
    
    length.times do |index|
        swapped = true 
        i = 0
        1.upto(length - 1 - index) do |j|
            if nums[i] > nums[j]
                nums[i], nums[j] = nums[j], nums[i]
                swapped = false
            end 
            i += 1
        end
        break if swapped
    end
    nums
end

numbers = [4,3,78,2,0,2]
p bubble_sort(numbers)

