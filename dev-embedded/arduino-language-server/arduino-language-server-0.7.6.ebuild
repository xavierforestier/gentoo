# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="An Arduino Language Server based on Clangd to Arduino code autocompletion"
HOMEPAGE="https://github.com/arduino/arduino-language-server"
SRC_URI="
	https://github.com/arduino/${PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/xavierforestier/${PN}/releases/download/v${PV}/${P}-vendor.tar.xz
"
inherit go-module

LICENSE="AGPL-3.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="
	>=dev-lang/go-1.12.0
"
BDEPEND=""

src_compile() {
	ego build
}
src_install() {
	dobin arduino-language-server
	einstalldocs
}
