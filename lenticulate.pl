#!/usr/bin/perl
# lenticulate.pl

# Usage: perl lenticulate.pl inputFile1 inputFile2 outputFile

# This can be used to read strips from two input images and alternately
# write them to an output image.  The output image can then be
# manually folded to create a crude lenticular picture.

# A description of the overall process can be found at:
# http://photojojo.com/content/diy/how-to-make-lenticular-images/
#
# This depends on the perl GD image manipulation module.
#
#  1-Jul-2007 Doug Toppin - initial
# 24-Nov-2016 Doug Toppin - updating

# uncomment the following and the var declarations later
# for debug if needed
#use strict;

# perl image manipulation module
use GD;

#my $width1;
#my $height1;
#my $width2;
#my $height2;
#my $widthout;
#my $heightout;
#my $jpg_data;
#my $imagein1;
#my $imagein2;
#my $slice;
#my $i;
#my $outfile;
#my $infile1;
#my $infile2;
#my $srcX = 0;
#my $srcY = 0;
#my $dstX = 0;
#my $dstY = 0;

# percent of the input images used for each slice
my $sliceSize = 10;

if ( @ARGV != 3) {
   print "error: incorrect number of arguments\n";
   usage($0);
   exit(1);
}

($infile1, $infile2, $outfile) = @ARGV;

if (! -e $infile1) {
   print "error: input file not found: ", $infile1, "\n";
   usage($0);
   exit(1);
}
if (! -e $infile2) {
   print "error: input file not found: ", $infile2, "\n";
   usage($0);
   exit(1);
}

# if output file exists make the user remove it
if (-e $outfile) {
   print "error: output file ", $outfile, " must not exist\n";
   usage($0);
   exit(1);
}

# open the input files and read into memory
$imagein1 = GD::Image->new($infile1) || die;
$imagein2 = GD::Image->new($infile2) || die;

# get image width/height of both input files
($width1, $height1) = $imagein1->getBounds();
($width2, $height2) = $imagein2->getBounds();

# the input images must have the same width/height
if (($width1 != $width2) || ($height1 != $height2)) {
   print("error: widths/heights not the same\n");
   usage($0);
   exit(1);
}

# the output image will be twice as wide as the input
$widthout = $width1 * 2;

# the output image will be the same height as the input
$heightout = $height1;

# each slice of the input files to copy will be 10% of the width
$slice = $width1 / $sliceSize;

# create the output image object
my $imageout = GD::Image->new($widthout, $heightout) || die;

# now we are going to loop through each strip of the input
# images and copy a slice to the output image, alternating
# between each input file
for ($i=0; $i < $sliceSize; $i++) {

   # use the GD copy function to copy a slice of input to
   # the output file, the arguments are:
   # copy(sourceimage, dstX, dstY, srcX, srcY, width, height)
   $imageout->copy($imagein1, $dstX, $dstY, $srcX, $srcY, $slice, $heightout);

   # move to the next slice location in the output image
   $dstX += $slice;

   # copy image 2 strip
   $imageout->copy($imagein2, $dstX, $dstY, $srcX, $srcY, $slice, $heightout);

   $dstX += $slice;

   # now move to the next start point for the input file x,y coords
   $srcX += $slice;

}

# convert the output images to jpeg
$jpg_data = $imageout->jpeg || die "error converting to jpeg";

# create the output file and write the binary image to it
open FILEOUT, "> $outfile" || die;
binmode FILEOUT || die;
print FILEOUT $jpg_data || die;
close FILEOUT || die;

exit(0);

sub usage() {
   print "Usage: perl $0 inputFile1 inputFile2 outputFile\n";
   print "    Example: perl $0 infile1.jpg infile2.jpg outfile.jpg\n";
   print "    Combine two images in strips to produces a third image.\n";
   print "    The output image will be twice the width as the input.\n";
   print "    The input images must be the same width/height.\n";
}

