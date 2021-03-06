# PLEASE DO NOT EDIT THIS FILE. EDIT Templates/adoptopenjdk.rb.tmpl
cask 'adoptopenjdk11-openj9-jre' do
  version '11.0.6,10'
  sha256 'db7b0ad25b5a45babbc684d4e7daa60b5faf29d687ef9fa13539c69a13c1461a'

  # github.com/AdoptOpenJDK was verified as official when first introduced to the cask
  url 'https://github.com/AdoptOpenJDK/openjdk11-binaries/releases/download/jdk-11.0.6%2B10_openj9-0.18.1/OpenJDK11U-jre_x64_mac_openj9_11.0.6_10_openj9-0.18.1.pkg'
  appcast "https://github.com/AdoptOpenJDK/openjdk#{version.major}-binaries/releases/latest"
  name 'AdoptOpenJDK 11 (OpenJ9) (JRE)'
  homepage 'https://adoptopenjdk.net/'

  pkg 'OpenJDK11U-jre_x64_mac_openj9_11.0.6_10_openj9-0.18.1.pkg'

  postflight do
    system_command '/usr/sbin/pkgutil', args: ['--pkg-info', 'net.adoptopenjdk.11-openj9.jre'], print_stdout: true
  end

  uninstall pkgutil: 'net.adoptopenjdk.11-openj9.jre'
end
