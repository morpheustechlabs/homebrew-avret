cask "avret" do
  version "1.1.7,2610051921"
  sha256 "8997df82f7880c825b69e67aaa0ef7920a67e08411d62e079a9a551dfe4fb487"

  url "https://avret.morpheusinnovation.com/downloads/AVRET-1.1.7-b2610051921.dmg?avret_release=8997df82f7880c82"
  name "AVRET"
  desc "Engineering workbench for Microchip AVR devices"
  homepage "https://github.com/morpheustechlabs/AVRET"

  depends_on macos: :ventura

  app "AVRET.app"
end
