def bubble_sort(array_to_sort)
    n = array_to_sort.length
    n.times do
        array_to_sort.each_with_index do | first, idx |
            sec = (array_to_sort[idx + 1])
            unless sec == nil
                if sec < first
                    alpha = first
                    beta = sec
                    array_to_sort[idx] = beta
                    array_to_sort[idx + 1] = alpha
                end
            end
        end
    end
    p array_to_sort
end

bubble_sort([4,3,78,2,0,2])