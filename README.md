lenticular
==========

Script for creating lenticular images (combine two images into one that is folded to expose both).

Lenticular images are the combination of two images in strips so that from one angle one image is visible and from the other angle the other image is visible.
This is an old Perl script that I wrote to do this and will hopefully evolve to something a bit more modern and better.
This should read strips from two input images and alternately write them to a single output file.
The output image can then be manually folded to create a crude lenticular picture.
When you cut the image from the print leave some space on each side and use that to hold the picture in the frame.

You will need to put the image into a frame that holds the folds in place.
The input files should be the same size and orientation.
There is very little error checking in the code (for now).

I've used this a few times very successfully and the result turns out pretty well.

Usage: `perl lenticulate.pl inputFile1 inputFile2 outputFile`

A description of the overall process can be found at:
[http://photojojo.com/content/diy/how-to-make-lenticular-images/](http://photojojo.com/content/diy/how-to-make-lenticular-images/)

This depends on the perl GD image manipulation module.

