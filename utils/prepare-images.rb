if ARGV.length != 1
  $stderr.puts("Usage: #{$0} <directory>")
  exit(1)
end
directory = ARGV[0]

images = Dir["#{directory}/*.png"]
images.each do |image|
  $stdout.puts("Processing: #{image}")
  `convert -trim -fuzz 10% -transparent white -resize 50x50 #{image} ./static/#{File.basename(image)}`
end
