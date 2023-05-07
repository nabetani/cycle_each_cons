class Array
  def cycle_each_cons1(n)
    return Enumerator.new{ cycle_each_cons1(n, &_1) } unless block_given?

    cycle.each_cons(n).take(length).each{ yield _1 }
  end
  def cycle_each_cons3(n)
    return Enumerator.new{ cycle_each_cons3(n, &_1) } unless block_given?
    (self+self[0,n-1]).each_cons(n){ yield _1 }
  end
end

pp [1,2,3,4,5].cycle_each_cons1(3).to_a
pp [1,2,3,4,5].cycle_each_cons3(3).to_a