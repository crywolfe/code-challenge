@false_count = 0

def change(cents)
  num = cents.to_i
  a = num.divmod(9)
  b = a[1].divmod(5)
  c = b[1].divmod(4)
  d = c[1].divmod(1)

  @count = a[0]+b[0]+c[0]+d[0]
  if b[0] == 1 && d[0] == 3
    @false_count = @false_count + 1
  end
end

1001.times do |i|
  change(i)
end
puts "Total false count is #{@false_count}"
