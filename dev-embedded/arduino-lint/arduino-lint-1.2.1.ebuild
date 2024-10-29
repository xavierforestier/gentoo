# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Tool to check for problems with Arduino projects"
HOMEPAGE="https://arduino.github.io/arduino-lint/1.2/ https://github.com/arduino/arduino-lint"
SRC_URI="
	https://github.com/arduino/${PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/xavierforestier/${PN}/releases/download/v${PV}/${P}-vendor.tar.xz
"
LICENSE="GPL-3.0"
SLOT="0"
KEYWORDS="~amd64"
DOCS=( docs/{index,rules}.md )


DEPEND=""
RDEPEND="
	>=dev-lang/go-1.17
	sys-devel/go-task
"
BDEPEND=""

src_compile() {
	task build
}
src_install() {
	doins arduino-lint
	einstalldocs
}
