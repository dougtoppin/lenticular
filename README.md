lenticular
==========

Script for creating lenticular images (combine two images into one that is folded to expose both).

Lenticular images are the combination of two images in strips so that from one angle one image is visible and from the other angle the other image is visible. The effect can be pleasing particularly when the two images are related.
In the example images below were a couple of vacation pictures. One of the group and the other of a place they visited.

This is an old Perl script that I wrote to do this and will hopefully evolve to something a bit more modern and better.
This should read strips from two input images and alternately write them to a single output file.
The output image can then be manually folded to create a crude lenticular picture.
When you cut the image from the print leave some space on each side and use that to hold the picture in the frame.

You will need to put the image into a frame that holds the folds in place.
The input files should be the same size and orientation.
There is very little error checking in the code (for now).

I've used this a few times very successfully and the result turns out pretty well.

Usage: `perl lenticulate.pl file1.jpg file2.jpg output.jpg`

Example files can be found at [file1.jpg](https://s3.amazonaws.com/dtoppin-images/file1.jpg), [file2.jpg](https://s3.amazonaws.com/dtoppin-images/file2.jpg) and the resulting output file at [output.jpg](https://s3.amazonaws.com/dtoppin-images/output.jpg)`

A description of the overall process can be found at:
[http://photojojo.com/content/diy/how-to-make-lenticular-images/](http://photojojo.com/content/diy/how-to-make-lenticular-images/)

This depends on the perl GD image manipulation module.

# Instructions
Here are a few steps that I used to get this working again on my MacBook Pro.

I used Vagrant to provision an Ubuntu instance and set up Perl on it.
The following is probably pretty close to what I did to get it going.

	vagrant init hashicorp/precise32
	vagrant up
	scp -P 2222 file1.jpg file2.jpg vagrant@127.0.0.1:
	vagrant ssh
	sudo apt-get install cpanminus
	sudo apt-get install libgd-gd2-perl
	git clone https://github.com/dougtoppin/lenticular.git
	cd lenticular
	perl lenticulate.pl ../file1.jpg ../file2.jpg output.jpg

Examples of what the generated (combined and folded) images can be found at the following links.

* [view1](https://cloud.githubusercontent.com/assets/1274131/10861269/5b868fe6-7f50-11e5-85ce-cce69eef28fe.jpg)
* [view2](https://cloud.githubusercontent.com/assets/1274131/10861270/5b87aae8-7f50-11e5-982c-322a74202ab6.jpg)
* [view3](https://cloud.githubusercontent.com/assets/1274131/10861271/5b8c26d6-7f50-11e5-8c81-a796bc36b5d5.jpg)

