Setup the VM for learning fast.ai (<http://course.fast.ai/>)

The install-gpu.sh in modified from <https://github.com/fastai/courses.git>

### Step to install
1. install *vagrant* (<https://www.vagrantup.com>) & *virtualbox* (<https://www.virtualbox.org>)
2. download this repository: ``git clone https://github.com/pomelyu/fastainn_setup.git`` or download the zip
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
vb.memory = "8196"
```
2G RAM is not enough for even the minimum batch_size 4\
8G RAM is OK for batch_size 16

See <http://gogojimmy.net/2013/05/26/vagrant-tutorial/> for more detail about the Vagrantfile

4. in repository root folder run ``vagrant up`` to boot the VM
5. use ``vagrant ssh`` to login the VM
6. ``cd ../../data`` and ``./install-gpu_modified.sh`` to install and config *Anaconda*, *theano*, *keras*, *cudnn* and *jupyter notebook* 
7. ``vim ~/.jupyter/jupyter_notebook_config.py`` to change the password of jupyter server (I have failed to config the password in the step, so I run the step 9. instead)
8. logout and then login the VM again to source the jupyter environment variable.
9. ``cd ~/course/nbs/``  and  ``jupyter notebook password`` to change the password of jupyter server
10. In directory ``~/course/nbs/``, run ``jupyter notebook`` to start the server
11. In host computer browser, enter ``localhost:8888`` and type the password to access the notebook

### Run lesson1
1. Run ``./get-lesson1.sh``
2. ``vim ~/.theanorc`` modify ``[global] device=gpu`` to ``[global] device=cpu``
3. ``vim ~/.keras/keras.json`` to setup the backend as ``theano``

### vagrant hotkey
vagrant 是一個可以方便設定虛擬機的工具，背後要用到 virtual box。但使用起來比 vb 還要輕量很多，\
ref: <http://gogojimmy.net/2013/05/26/vagrant-tutorial/>
* ``vagrant up`` VM 開機
* ``vagrant ssh`` ssh 登入 VM，預設 port 22
* ``vagrant halt`` VM 關機，建議沒事不用關機
* ``vagrant suspend`` VM 暫停，這個即使整台電腦重開也可以回復狀態
* ``vagrant resume`` 回復 VM 狀態
* ``vagrant box add`` 加入 box
* ``vagrant box list`` 列出所有 box
* ``vagrant init`` 產生 default 的 Vagrantfile

### tmux hotkey
讓 terminal 可以以一次跑多個程式，並可以儲存或還原目前的狀態，\
ref: <http://blog.chh.tw/posts/tmux-terminal-multiplexer/>
* ``tmux`` 開啟 tmux
* ``tmux attach`` 回復之前 detach 的狀態
* ``ctrl+b``+``"`` 產生上下分割視窗
* ``ctrl+b``+``%`` 產生左右分割視窗
* ``ctrl+b``+``o`` 切換游標的位置
* ``ctrl+b``+``d`` detach 目前狀態，回到原先的介面，程式還在背景執行

### jupyter notebook hotkey