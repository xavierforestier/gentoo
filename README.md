# ffado
My personal Gentoo Overlay
<h2>First installation</h2>
<code>layman -o https://raw.githubusercontent.com/xavierforestier/ffado/master/overlay.xml  -f -a xavierforestier
eix-update</code>

<h2>Update</h2>
<code>layman -S</code>: Sync overlay(s) including this one
<code>eix-update</code>: Update eix database

<h2>Jack2 scenario</h2>
<code>USE=-iee1394 emerge jack2</code>: Install Jack2 without ffado support : Jack2 (or jack-audio-connection-kit) is a pre-requisite for biulding ffado.
<code>emerge libffado</code>: Install ffado lib
<code>USE=iee1394 emerge jack2</code>: Rebuild Jack2 with ffado support

Note if you experience issue with multilibs, you may have to force 32bits supports in <code>/etc/portage/packae.use
media-sound/jack2 abi_x86_32
media-libs/libffado abi_x86_32</code>
