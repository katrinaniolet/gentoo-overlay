# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

#VIM_PLUGIN_VIM_VERSION="7.0"
inherit vim-plugin

EAPI="2"

DESCRIPTION="vim plugin: Syntax highlighting for D1.0 and D2.0 programming language"
HOMEPAGE="http://www.vim.org/scripts/script.php?script_id=379"
LICENSE="as-is"
KEYWORDS="alpha amd64 ia64 mips ppc sparc x86"
IUSE=""

SRC_URI="http://www.vim.org/scripts/download_script.php?src_id=13889
		-> d.vim"

src_unpack() {
	cd "${WORKDIR}"
	mkdir -p "${WORKDIR}/${P}/syntax"
	cp "${DISTDIR}/d.vim" "${WORKDIR}/${P}/syntax"
	#chmod 0644 "${WORKDIR}/${P}/syntax/d.vim"
}
