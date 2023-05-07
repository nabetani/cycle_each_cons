class Array
  def cycle_each_cons2(n)
    unless block_given?
      return Enumerator.new(method(:size)) { cycle_each_cons2(n, &_1) }
    end

    enum = cycle.each_cons(n)
    size.times { yield enum.next }
    self
  end
end

ary1 = [*1..10]
(1<<20).times do |n|
  ary1.cycle_each_cons2(3){ _1 } 
end
