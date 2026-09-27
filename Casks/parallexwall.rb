cask "parallexwall" do
  version "3.3.1"
  sha256 "8c49976190b9c3ca5bbe292137961c9a0a0a77d45f39ba3a5287c704ce489a04"

  url "https://github.com/alphastar-avi/ParallaxWall/releases/download/v#{version}/ParallaxWallpaper.dmg"
  name "Parallax Wallpaper"
  desc "3D multi-layer desktop parallax wallpaper"
  homepage "https://github.com/alphastar-avi/ParallaxWall"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "parallexWall.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/parallexWall.app"],
                   sudo: false,
                   print_stderr: false
  end

  zap trash: [
    "~/Library/Application Support/parallexWall",
    "~/Library/Preferences/com.alphastar.parallexWall.plist",
  ]
end
