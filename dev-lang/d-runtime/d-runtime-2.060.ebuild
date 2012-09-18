# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
inherit eutils git-2

DESCRIPTION="Reference compiler for the D programming language"
HOMEPAGE="http://www.digitalmars.com/d/"

LICENSE="Boost-1.0"
SLOT="2"
KEYWORDS="~amd64"
IUSE="doc"

EGIT_REPO_URI="git://github.com/D-Programming-Language/druntime.git"
EGIT_COMMIT="v${PV}"

RESTRICT="mirror"

DEPEND="=dev-lang/dmd-${PV}"
RDEPEND="${DEPEND}"

src_compile() {
	epatch "${FILESDIR}/x86_64.patch"
	make -f posix.mak
}

src_install() {
	dolib.a "lib/libdruntime.a" || die "Install failed"
	dodir /usr/include/druntime
	mv "import"/* "${D}/usr/include/d/"
	if use doc ; then
		dodoc "doc"/*
	fi
}

