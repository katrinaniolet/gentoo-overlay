# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
inherit eutils git-2

DESCRIPTION="Reference compiler for the D programming language"
HOMEPAGE="http://www.digitalmars.com/d/"

LICENSE="DMD"
SLOT="2"
KEYWORDS="~amd64"
IUSE=""

EGIT_REPO_URI="git://github.com/D-Programming-Language/dmd.git"
EGIT_COMMIT="v${PV}"

DEPEND="!dev-lang/dmd-bin:2"

src_compile() {
	patch "${FILESDIR}/x86_64.patch"
	cd "src"
	ln -s . mars
	make -f posix.mak || die "make failed"
}

src_install() {
	newbin "src/dmd" dmd || die "Install failed"
	newbin "src/idgen" idgen || die "Install failed"
	newbin "src/impcnvgen" impcnvgen || die "Install failed"
	newbin "src/optabgen" optabgen || die "Install failed"
}

