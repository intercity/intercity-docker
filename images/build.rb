require 'pty'

$version = "0.2.0"

$base_image = "intercity/base:#{$version}"
$image = "intercity/intercity:#{$version}"

def run(command)
  lines = []
  PTY.spawn(command) do |stdin, stdout, pid|
    begin
      stdin.each do |line|
        lines << line
        puts line
      end
    rescue Errno::EIO
      # we are done
    end
  end

  lines
end

def build(path, tag)
  lines = run("cd #{path} && docker build -t #{tag} .")
  img = lines[-1]["successfully built ".length..-1].strip

  run("docker save #{img} | docker load")
end

build "base", $base_image
build "intercity", $image
