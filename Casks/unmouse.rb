cask "unmouse" do
  version "0.3.0"
  sha256 "9eb1b5dbfe14855ac7374a73e8b93515a24345a7a73581a2f7633aa80220740a"

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
    After each install or upgrade, turn Unmouse off and on again in
    System Settings > Privacy & Security > Accessibility.
  EOS
end
