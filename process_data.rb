def generate_assoc(name, data)
  str = "#{name} = {\n"
  str << data.map {|s| "  #{s[0].inspect} => #{s[1].inspect}" }.join(",\n")
  str << "\n}\n"
end

puts "# coding: utf-8"
subscrs, superscrs, syms = %w[subscripts superscripts symbols].map do |f|
  data = File.new("./data/#{f}").readlines.map {|l| l.split }
  puts generate_assoc("$latex_#{f}", data.sort_by {|k| k[0] }.reverse)
end
