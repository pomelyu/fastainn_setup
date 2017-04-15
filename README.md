Setup the VM for learning fast.ai (<http://course.fast.ai/>); 
The install-gpu.sh in modified from <https://github.com/fastai/courses.git>

### Step to install
1. install *vagrant* (<https://www.vagrantup.com>) & *virtualbox* (<http://virtualenv.pypa.io>)
2. download this repository: ``git clone `` or download the zip
3. config the VM (in Vagrantfile):
Forward the port used by jupyter notebook to localhost
```
config.vm.network "forwarded_port", guest: 8888, host: 8888
```

Config the synced forder from host computer to VM
```
config.vm.synced_folder "./data", "/data"
config.vm.synced_folder "./course", "/home/vagrant/course"
```

Setup the VM memory
```
vb.memory = "2048"
```

See <http://gogojimmy.net/2013/05/26/vagrant-tutorial/> for more detail about the Vagrantfile

4. in repository root folder run ``vagrant up`` to boot the VM
5. use ``vagrant ssh`` to login the VM
6. ``cd ../../data`` and ``./install-gpu_modified.sh`` to install and config *Anaconda*, *theano*, *keras*, *cudnn* and *jupyter notebook* 
7. ``vim ~/.jupyter/jupyter_notebook_config.py`` to change the password of jupyter server (I have failed to config the password in the step, so I run the step 8. instead)
8. ``cd ~/course/courses/deeplearning1/nbs/``  and  ``jupyter notebook password`` to change the password of jupyter server
9. In directory ``~/course/courses/deeplearning1/nbs/``, run ``jupyter notebook`` to start the server
10. In host computer browser, enter ``localhost:8888`` and type the password to access the notebook

### vagrant hotkey
### tmux hotkey
### jupyter notebook hotkey