# require 'rubygems'
$: << "/home/alban/share/projects/tryphon.org/system-builder/lib"

require 'system_builder'
require 'system_builder/task'

SystemBuilder::Task.new(:playbox) do
  SystemBuilder::DiskImage.new("dist/disk").tap do |image|
    image.boot = SystemBuilder::DebianBoot.new("build/root").tap do |boot|
      boot.mirror = "http://127.0.0.1:9999/debian"
    end
    image.boot.configurators << SystemBuilder::PuppetConfigurator.new
  end
end

task :setup do
  if ENV['WORKING_DIR']
    %w{build dist}.each do |subdir|
      working_subdir = File.join ENV['WORKING_DIR'], subdir
      puts "* create and link #{working_subdir}"
      mkdir_p working_subdir
      ln_sf working_subdir, subdir
    end
  end
end