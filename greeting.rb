def greeting
  firstOne = ARGV.shift
  ARGV.each do |nThOne|
    puts "#{firstOne} #{nThOne}"
  end
end

greeting
