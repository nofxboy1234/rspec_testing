def testing(a, b = 1, *c, d: 1, **e)
  puts "a is #{a}"
  puts "b is #{b}"
  puts "c is #{c}"
  puts "d is #{d}"
  puts "e is #{e}"
end

testing('a', 'b', 'c', 'd', 'e', d: 2, x: 1)

puts "\n"

def testing(a, b = 1, *c, f: 1, **e)
  puts "a is #{a}"
  puts "b is #{b}"
  puts "c is #{c}"
  puts "f is #{f}"
  puts "e is #{e}"
end

testing('a', 'b', 'c', 'd', 'e', d: 2, x: 1)

puts "\n"

def testing(a, b = 1, *c, e)
  puts "a is #{a}"
  puts "b is #{b}"
  puts "c is #{c}"
  puts "e is #{e}"
end

testing('a', 'b', 'c', 'd', 'e', d: 2, x: 1)

puts "\n"

def testing(a, b = 1, *c)
  puts "a is #{a}"
  puts "b is #{b}"
  puts "c is #{c}"
end

testing('a', 'b', 'c', 'd', 'e', d: 2, x: 1)

puts "\n"

def testing(a, b = 1)
  puts "a is #{a}"
  puts "b is #{b}"
end

testing(d: 2, x: 1)

puts "\n"

def testing(a, b)
  puts "a is #{a}"
  puts "b is #{b}"
end

testing(99, d: 2, x: 1)

puts "\n"

def testing(a, b)
  puts "a is #{a}"
  puts "b is #{b}"
end

testing(99, {d: 2, x: 1})

puts "\n"

def testing(a, **b)
  puts "a is #{a}"
  puts "b is #{b}"
end

testing(99, d: 2, x: 1)

puts "\n"

def testing(a)
  puts "a is #{a}"
end

testing(d: 2, x: 1)

puts "\n"

def testing(a)
  puts "a is #{a}"
end

testing({d: 2, x: 1})

puts "\n"

def testing(**a)
  puts "a is #{a}"
end

testing(d: 2, x: 1)

puts "\n"

def testing(a)
  puts "a is #{a}"
end

testing(d: 2, x: 1)

puts "\n"

def testing(a)
  puts "a is #{a}"
end

testing({d: 2, x: 1})

puts "\n"

def foo(a, *b, d:, **c)
  [a, b, c]
end

p foo 10, 20, 30, d: 40, e: 50

puts "\n"

def foo(a, *b, **c)
  [a, b, c]
end

p foo 10
p foo 10, 20, 30
p foo 10, 20, 30, d: 40, e: 50
p foo 10, d: 40, e: 50

puts "\n"

opts = {d: 40, e: 50}
p foo 10, opts, f: 60
p foo 10, **opts, f: 60
