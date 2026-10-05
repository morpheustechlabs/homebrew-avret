cask "avret" do
  version "1.1.6"
  sha256 "711660764310b8c3bc530fbe7ac556005ca5d14cd11e48ee56fa58745bbb95fc"

  url "https://github.com/morpheustechlabs/AVRET/releases/download/v#{version}/AVRET-latest.dmg",
      verified: "github.com/morpheustechlabs/AVRET/"
  name "AVRET"
  desc "Native macOS engineering workbench for Microchip AVR devices"
  homepage "https://github.com/morpheustechlabs/AVRET"

  depends_on macos: :ventura

  app "AVRET.app"
end
