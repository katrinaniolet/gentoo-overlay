# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils git-2

DESCRIPTION="Reference compiler for the D programming language"
HOMEPAGE="http://www.digitalmars.com/d/"

LICENSE="Boost-1.0"
SLOT="2"
KEYWORDS="~x86 ~amd64"
IUSE=""
EAPI="2"

EGIT_REPO_URI="git://github.com/D-Programming-Language/druntime.git"
EGIT_COMMIT="v${PV}.zip"

RESTRICT="mirror"

DEPEND="=dev-lang/dmd-${PV}"
RDEPEND="dev-util/dmd-common
	amd64? ( app-emulation/emul-linux-x86-compat )"

src_compile() {
	export HOME="$(pwd)"
	make -f posix.mak
}

src_install() {
	dolib.a "libdruntime.a" || die "Install failed"
	dodir /usr/include/druntime
	mv "import"/* "${D}/usr/include/druntime/"
}