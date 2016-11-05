To enable mixer debug edit file 
<b>/usr/lib64/python3.5/site-packages/ffado/config.py</b>
and set 
<code>DEBUG_BYPASSDBUS = True</code>

ffaddo-mixer will create a mixer for each possible mixer (note ffado-mixer will be quite slow while creating ~100 possible mixers )
