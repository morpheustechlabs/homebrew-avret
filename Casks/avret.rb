cask "avret" do
  version "1.1.7,2610051921"
  sha256 "e39791baa85292d2bc9f8dd609419cf581a15647ad7ce38f74404a6a01ce2062"

  url "https://avret.morpheusinnovation.com/downloads/AVRET-1.1.7-b2610051921.dmg"
  name "AVRET"
  desc "Engineering workbench for Microchip AVR devices"
  homepage "https://github.com/morpheustechlabs/AVRET"

  depends_on macos: :ventura

  app "AVRET.app"
end
