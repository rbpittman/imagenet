# Prereq: Must have convert_imageset command from caffe-tools. If
# caffe is not installed, use "sudo apt install caffe-tools-cpu", and
# ensure the convert_imageset command is then available (on PATH). 

TRAIN_URL=http://www.image-net.org/challenges/LSVRC/2012/nnoupb/ILSVRC2012_img_train.tar;
VAL_URL=http://www.image-net.org/challenges/LSVRC/2012/nnoupb/ILSVRC2012_img_val.tar;
TEST_URL=http://www.image-net.org/challenges/LSVRC/2012/nnoupb/ILSVRC2012_img_test.tar;

download() {
    if [ -z ${1+x} ]; then
	echo "Error in download function: parameter expected";
	exit 1;
    fi
    wget -c $1;
}

echo "Downloading training data...";
download $TRAIN_URL;
echo "Downloading validation data...";
download $VAL_URL;
echo "Downloading testing data...";
download $TEST_URL;

echo "Downloading aux data...";
wget -c http://dl.caffe.berkeleyvision.org/caffe_ilsvrc12.tar.gz
echo "Unzipping aux data";
tar -xf caffe_ilsvrc12.tar.gz && rm -f caffe_ilsvrc12.tar.gz

#TODO
TRAIN_DATA_ROOT=/path/to/imagenet/train/
VAL_DATA_ROOT=/path/to/imagenet/val/

