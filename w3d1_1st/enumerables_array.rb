class Array

    def my_each (&prc)
    i = 0 
    while i < self.length    
        prc.call(self[i])
        i += 1
    end
    self
    end

    def my_select(&prc)
        results = []
    self.my_each do |num|
            results << num if prc.call(num)
        end
        results
    end

    def my_reject(&prc)
        results = []
        self.my_each do |num|
                results << num if !prc.call(num)
            end
            results
    end

  def my_any?(&prc)
    self.my_each do |num|
     if prc.call(num) 
        return true
     end
    end
    false
    end
       
    def my_all?(&prc)
        self.my_each do |num|
            if !prc.call(num) 
               return false
            end
           end
           true
    end

    def my_flatten
        results = []
        self.my_each do |ele|
            if ele.is_a?(Array)
                results += ele.my_flatten
            else
                results << ele
            end
        end
        return results
    end

    def my_zip(*arrs)
     new_arr = arrs << self
      first = new_arr.pop
      new_arr.unshift(first)
      (0...self.length).map do |i|
        (0...arrs[0].length).map do |j|
          if  new_arr[j][i].is_a?(Integer)
            return new_arr[j][i]
          else
            nil
          end
        end
      end
    end

end

a = [ 4, 5, 6 ]
b = [ 7, 8, 9 ]
p [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
p a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
p [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]
