# bash_bioinfo

In order to use the functions in your command line, you can either source the file (which does not permanently add these functions to your shell): 

```
source /path/to/bash_bioinfo
```

Or you could append the file to, for instance, your ~/.bashrc file (permanently adding the functions to the shell):

```
cat /home/gabriel/Dropbox/repos/bash_bioinfo/bash_bioinfo >> ~/.bashrc && source ~/.bashrc
```

# backup.sh

Script written by [Igor Costa](https://github.com/igorrcosta).
This script uses rsync to backup all home folders to an directory in a server.
It also uses the 'date' command to calculate the time elapsed in the process.
