lenticular
==========

Script for creating lenticular images (combine two images into one that is folded to expose both).

Lenticular images are the combination of two images in strips so that from one angle one image is visible and from the other angle the other image is visible.
This is an old Perl script that I wrote to do this and will hopefully evolve to something a bit more modern and better.

I've used this a few times very successfully and the result turns out pretty well.

Usage: `perl lenticulate.pl inputFile1 inputFile2 outputFile`

This can be used to read strips from two input images and alternately
write them to an output image.
The output image can then be manually folded to create a crude lenticular picture.

A description of the overall process can be found at:
[http://photojojo.com/content/diy/how-to-make-lenticular-images/](http://photojojo.com/content/diy/how-to-make-lenticular-images/)

This depends on the perl GD image manipulation module.

