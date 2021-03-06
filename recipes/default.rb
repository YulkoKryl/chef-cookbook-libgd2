include_recipe "libfreetype"
include_recipe "libjpeg"
include_recipe "libpng"

packages = Array.new

case node[:lsb][:codename]
when "lucid", "precise"
  packages |= %w/
    libgd2-noxpm
  /
end

packages.each do |pkg|
  package pkg do
    action [:install, :upgrade]
  end
end
