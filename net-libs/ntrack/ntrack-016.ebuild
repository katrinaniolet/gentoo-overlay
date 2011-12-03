
EAPI=3

#General information
LICENSE="LGPL3"
DESCRIPTION="Network connectivity tracking library for desktop applications"
IUSE="pygobject developerbuild qt gobject glib"
HOMEPAGE="http://launchpad.net/ntrack"
KEYWORDS="amd64 x86"

#Source location
SRC_URI="http://launchpad.net/ntrack/main/016/+download/${P}.tar.gz"

#These make creating new ebuilds much easier
MIN_QT_VERSION="4.6.3"

RDEPEND="qt? ( >=x11-libs/qt-core-${MIN_QT_VERSION} )
	glib? ( >=dev-lib/glib-2.0 )
	pygobject? ( >=dev-python/pygobject-2.0 )
	"
DEPEND="${DEPEND}
	"

SLOT="0"

src_configure() {

	CONFIG=""
	if use pygobject  ; then
		CONFIG="${CONFIG} --with-pygobject=yes"
	else
		CONFIG="${CONFIG} --with-pygobject=no"
	fi
	if use  developerbuild ; then
		CONFIG="${CONFIG} --enable-developer-build"
	fi
	if use qt ; then
		CONFIG="${CONFIG} --with-qt4=yes"
	else
		CONFIG="${CONFIG} --with-qt4=no"
	fi
	if use  gobject ; then
		CONFIG="${CONFIG} --with-gobject=yes"
	else
		CONFIG="${CONFIG} --with-gobject=no"
	fi
	if use glib ; then
		CONFIG="${CONFIG} --with-glib2=yes"
	else
		CONFIG="${CONFIG} --with-glib2=no"
	fi

	econf ${CONFIG} || die "Make failed!"
}

src_install() {
	emake DESTDIR="${D}" install || die "Install failed"
	dodoc README ChangeLog NEWS || die
}

