# ffado
My personal Gentoo Overlay
<h2>Overlay First installation</h2>
<code>layman -o https://raw.githubusercontent.com/xavierforestier/ffado/master/overlay.xml  -f -a xavierforestier
eix-update</code>

<h2>Overaly Update</h2>
<code>layman -S</code>: Sync overlay(s) including this one<br>
<code>eix-update</code>: Update eix database<br>
<code>emerge -uva ...</code>: Update stuffs...

<h2>Jack2 / ffado install</h2>
<code>USE=-iee1394 emerge jack2</code>: Install Jack2 without ffado support : Jack2 (or jack-audio-connection-kit) is a pre-requisite for building ffado.<br>
<code>emerge libffado</code>: Install ffado lib<br>
<code>USE=iee1394 emerge jack2</code>: Rebuild Jack2 with ffado support<br>

<p><u>Note:</u> if you experience issue with multilibs, you may have to force 32bits supports in <code>/etc/portage/package.use</code><br>
<code>media-sound/jack2 abi_x86_32</code><br>
<code>media-libs/libffado abi_x86_32</code></p>

<h2>Jack2 configuration</h2>
<code>jack_control dl</code> : Make sure firewire (ffado) driver is listed<br>
<code>jack_control ds firewire</code> : Setup firewire driver as default one<br>
<code>jack_control dg</code> : Check firewire is default one<br>
<code>jack_control ep</code> : Dispay default drivers setting (adjust if necessarry)<br>
Finaly launch QJackCtl then your favorite app :)

