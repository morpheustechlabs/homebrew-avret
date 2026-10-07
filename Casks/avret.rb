cask "avret" do
  version "1.2.4,2610061809"
  sha256 "2069e5dc058c6f025ebfe32e49d17d50c02a38e0e76186685f841ab71ca6b12d"

  url "https://github.com/morpheustechlabs/AVRET/releases/download/v1.2.4/AVRET-1.2.4-b2610061809.dmg"
  name "AVRET"
  desc "Engineering workbench for Microchip AVR devices"
  homepage "https://github.com/morpheustechlabs/AVRET"

  depends_on macos: :ventura

  app "AVRET.app"
end
