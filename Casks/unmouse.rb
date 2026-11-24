cask "unmouse" do
  version "0.4.1"
  sha256 "a8dd3cb1e11781d70efdf184dc060507429ded9d6476b2e9bfcfe12faaf259ec"

  url "https://github.com/gincheong/Unmouse/releases/download/v#{version}/Unmouse.zip"
  name "Unmouse"
  desc "Click, scroll, and point anywhere on screen with the keyboard"
  homepage "https://github.com/gincheong/Unmouse"

  depends_on macos: :ventura

  app "Unmouse.app"

  # 공증받지 않은 임시 서명 앱이라 quarantine 속성이 남아 있으면 Gatekeeper가 실행을 차단한다.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Unmouse.app"]
  end

  uninstall quit: "io.github.gincheong.Unmouse"

  zap trash: "~/.config/unmouse"

  caveats <<~EOS
    Unmouse is ad-hoc signed, so its signature changes with every release.
    After each upgrade, remove Unmouse from the list in
    System Settings > Privacy & Security > Accessibility and add it again.
    Turning it off and on is not enough.
  EOS
end
