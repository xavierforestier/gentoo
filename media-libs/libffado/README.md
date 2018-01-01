<h1>Versions</h1>
2.9999 : Trunk SVN version (development version)<br>
2.4.9999 : 2.4.x SVN branche<br>
2.3.9999 : 2.3.x SVN branche<br>
2.4.0 : stable / beta releases

To enable mixer debug edit file 
<b>/usr/lib64/python3.6/site-packages/ffado/config.py</b>
and set 
<code>DEBUG_BYPASSDBUS = True</code>

ffaddo-mixer will create a mixer for each possible mixer (note ffado-mixer will be quite slow while creating ~100 possible mixers )
