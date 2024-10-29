# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
EAPI=8
inherit go-module bash-completion-r1

DESCRIPTION="A task runner / simpler Make alternative written in Go"
HOMEPAGE="https://taskfile.dev/ https://github.com/go-task/task"

SRC_URI="
	https://github.com/go-task/task/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/xavierforestier/${PN}/releases/download/v${PV}/${P}-vendor.tar.xz
"
KEYWORDS="~amd64"

IUSE="bash-completion fish-completion zsh-completion"

LICENSE="MIT"
SLOT="0"
BDEPEND="dev-go/gox"

#RESTRICT="test"

DOCS=( LICENSE {README,CHANGELOG}.md )
HTML_DOCS=( docs )

MY_PN="task"
S="${WORKDIR}/${MY_PN}-${PV}"

src_compile() {
	export CGO_ENABLED=0
	cd cmd/task || die
	gox \
		-os=$(go env GOOS) \
		-arch=$(go env GOARCH) \
		-output task \
		-ldflags "-X main.version=${PV}-gentoo -X github.com/go-task/task/v3/internal/version.version=${PV}-gentoo" \
		-verbose \
		. || die
}

src_install() {
	dobin cmd/task/task
	use bash-completion && newbashcomp completion/bash/${MY_PN}.bash ${MY_PN}
	use fish-completion && ( insinto /usr/share/fish/vendor_completions.d && doins completion/fish/${MY_PN}.fish )
	use zsh-completion && ( insinto  /usr/share/zsh/site-functions && doins completion/zsh/_${MY_PN} )
}
