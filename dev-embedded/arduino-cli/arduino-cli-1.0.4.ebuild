# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Arduino command line tool"
HOMEPAGE="https://arduino.github.io/arduino-cli/latest/ https://github.com/arduino/arduino-cli"
SRC_URI="
	https://github.com/arduino/${PN}/archive/refs/tags/v${PV}.tar.gz 
	https://github.com/xavierforestier/${PN}/releases/download/v${PV}/${P}-vendor.tar.xz
"
inherit go-module

LICENSE="GPL-3.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	>=dev-lang/go-1.21.0
	sys-devel/go-task
"
BDEPEND=""

src_compile() {
	task build
}
src_install() {
	dobin arduino-cli
}
