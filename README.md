# SmoothCarve
3D Engraving for the K40 laser cutter using Smoothieboard
Licensed under GNU General Public License v3.0

This is a very quick and dirty Matlab script to create GCodes for 3D engraving on my K40 'Blue Box' laser cutter. It requires that a Smoothieboard has been fitted to the laser in place of the standard Moshidraw type board (see: http://smoothieware.org/ for details). It also assumes that your origin (X0 Y0) is top left. Mine is, yours might not be. Apart from that it should work for any Smoothieboard based laser cutter.

WARNING!
This is pretty much pre-alpha software and it is not written well at all - there is no error checking, there is nothing to prevent you creating GCodes that will cos you to over run you bed dimensions, there is nothing to stop you over powering your laser tube, driving the motors too fast etc. It doesn't even bother to check if the output file exists/has content, it just overwrites it without warning. I will probably not fix these issues as I plan to move the entire project to a propre language at some point.

Output Progress: it's meant to display the progress as it writes teh file, currently it doesn't update until 100%. Which is really, really useful. Progress is also piped to the Matlab command window though.

Contrast Adjustment: Pops up a really funky Matlab image toolbox contrast adjustment tool. You can do whatever you like in here, it will change the displayed picture but it's pretty much completly ignored when generating the GCode. I did warn you, this is badly written, pre-alpha software!


Configuration
You can modify the Pre Job codes and Post Job codes by editing the relavent .m files, see comments for guidance. If you're running the precompiled version, then you'll have to edit the output manually once it's created. The text file uses \n line termination, so Notepad probably won't like it and you'll need a proper text editor (On windows I recommend Notepad++).

Off the top of my head the rest of the variables are all changeable from the UI so you shouldn't need to change anything else.
