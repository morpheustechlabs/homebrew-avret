cask "avret" do
  version "1.1.8,2610061221"
  sha256 "5eaccd63d49636bf30995ef0a656e75aa570434e86dac81a41e2192cfad1cd1c"

  url "https://github.com/morpheustechlabs/AVRET/releases/download/v1.1.8/AVRET-1.1.8-b2610061221.dmg"
  name "AVRET"
  desc "Engineering workbench for Microchip AVR devices"
  homepage "https://github.com/morpheustechlabs/AVRET"

  depends_on macos: :ventura

  app "AVRET.app"
end
