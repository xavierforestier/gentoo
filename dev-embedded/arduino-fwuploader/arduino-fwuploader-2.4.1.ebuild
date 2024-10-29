# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="A Command Line Tool made to update the firmware and/or add SSL certificates for any Arduino board equipped with WINC or NINA Wi-Fi module."
HOMEPAGE="https://arduino.github.io/arduino-fwuploader/ https://github.com/arduino/arduino-fwuploader"
SRC_URI="
	https://github.com/arduino/${PN}/archive/refs/tags/${PV}.tar.gz
	https://github.com/xavierforestier/${PN}/releases/download/v${PV}/${P}-vendor.tar.xz
"
inherit go-module

LICENSE="AGPL-3.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86"
DOCS=( docs/{index,plugins,usage,deprecated}.md )
RDEPEND="
	>=dev-lang/go-1.18.0
	sys-devel/go-task
"
BDEPEND=""

src_compile() {
	use amd64 && task dist:Linux_64bit
	use arm64 && task dist:Linux_ARM64
	use x86   && task dist:Linux_32bit
}

src_install() {
	use amd64 && dobin dist/arduino-fwuploader_linux_amd64/arduino-fwuploader
	use arm64 && doins dist/arduino-fwuploader_linux_arm64/arduino-fwuploader
	use x86   && dobin dist/arduino-fwuploader_linux_386/arduino-fwuploader
	einstalldocs
}
