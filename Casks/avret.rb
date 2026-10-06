cask "avret" do
  version "1.1.7,2610051921"
  sha256 "271f5227331f9bef8f28de1c509de06128f28f89649699c4125b4e4027378db1"

  url "https://avret.morpheusinnovation.com/downloads/AVRET-1.1.7-b2610051921.dmg?avret_release=271f5227331f9bef"
  name "AVRET"
  desc "Engineering workbench for Microchip AVR devices"
  homepage "https://github.com/morpheustechlabs/AVRET"

  depends_on macos: :ventura

  app "AVRET.app"
end
