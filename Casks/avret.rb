cask "avret" do
  version "1.1.7,2610051921"
  sha256 "3633db3921e20e3c9debc09d22833ab520c8295a23f218ce8052c0be322d479d"

  url "https://avret.morpheusinnovation.com/downloads/AVRET-1.1.7-b2610051921.dmg?avret_release=3633db3921e20e3c"

  name "AVRET"
  desc "Native macOS engineering workbench for Microchip AVR devices"
  homepage "https://github.com/morpheustechlabs/AVRET"

  depends_on macos: :ventura

  app "AVRET.app"
end
