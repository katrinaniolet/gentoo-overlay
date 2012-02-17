# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils git-2

EAPI="2"

DESCRIPTION="The Phobos standard library for DMD"
HOMEPAGE="http://www.digitalmars.com/d/"
EGIT_REPO_URI="git://github.com/D-Programming-Language/phobos.git"
EGIT_COMMIT="v${PV}"

LICENSE="Boost-1.0"
SLOT="2"
KEYWORDS="~amd64"
IUSE=""
EAPI="2"

DEPEND="=dev-lang/dmd-${PV}
	=dev-lang/d-runtime-${PV}"
RDEPEND="${DEPEND}"

src_compile() {
	epatch "${FILESDIR}/runtimelocation.patch"
	epatch "${FILESDIR}/x86_64.patch"
	make -I/usr/include/druntime -f posix.mak || die "Phobos compilation failed"
}

src_install() {
	dolib.a "${WORKDIR}/${PF}/generated/linux/release/64/libphobos2.a" || die "Install failed"
	rm -rf "generated"
	dodir /usr/include/phobos2
	mv * "${D}/usr/include/d/"
}

