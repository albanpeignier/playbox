require 'rubygems'

require 'system_builder'
require 'system_builder/task'

load './local.rb' if File.exists?("./local.rb")

SystemBuilder::Task.new(:playbox) do
  SystemBuilder::DiskImage.new("dist/disk").tap do |image|
    image.boot = SystemBuilder::DebianBoot.new("build/root")
    image.boot.configurators << SystemBuilder::PuppetConfigurator.new
  end
end

desc "Setup your environment to build a playbox image"
task :setup => "playbox:setup" do
  if ENV['WORKING_DIR']
    %w{build dist}.each do |subdir|
      working_subdir = File.join ENV['WORKING_DIR'], subdir
      puts "* create and link #{working_subdir}"
      mkdir_p working_subdir
      ln_sf working_subdir, subdir
    end
  end
end
