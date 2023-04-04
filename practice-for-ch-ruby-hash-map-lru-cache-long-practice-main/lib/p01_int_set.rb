class MaxIntSet 
  def initialize(max)
    @store = Array.new(max) {Array.new}
  end

  def insert(num)
    if num > @store.length || num < 0
      raise 'Out of bounds' 
      return false
    else
      @store << num 
      return true
    end

    # self << num if self.validate!(num)
    self[num] = true
     
    
  end

  def remove(num)
    @store.delete(num)
  end

  def include?(num)
    if @store.include?(num)
      return true
    end
    false

  end

  private

  def is_valid?(num)
    (self.length >= num) && (num >= 0)
  end

  def validate!(num)
    raise 'Out of bounds' unless self.is_valid?(num)
  end
end

class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    @store << num
  end

  def remove(num)
    @store.delete(num)
  end

  def include?(num)
    if @store.include?(num)
      return true
    end
    false
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    if !@store.include?(num)
      @store << num
    end
  end

  def remove(num)
    if @store.include?(num)
      @store.delete(num)
    end
  end

  def include?(num)
    if @store.include?(num)
      return true
    end
    false
  end

  private

  def num_buckets
    @store.length
  end

  def resize!
  end

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end
end