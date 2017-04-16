cd ~
cd course/nbs/
wget https://raw.githubusercontent.com/fastai/courses/master/deeplearning1/nbs/utils.py
wget https://raw.githubusercontent.com/fastai/courses/master/deeplearning1/nbs/vgg16.py
wget https://raw.githubusercontent.com/fastai/courses/master/deeplearning1/nbs/vgg16bn.py

# setup the dog and cat data
mkdir data
cd data
wget http://www.platform.ai/data/dogscats.zip
sudo apt-get install unzip
unzip -q dogscats.zip