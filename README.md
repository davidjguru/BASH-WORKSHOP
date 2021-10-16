# BASH-WORKSHOP
Storage for some scripts used in the Bash Scripting Workshop (2021 - 2022).   

## Initial Steps 
Ok, In order to get all our scripts available from any direction, we have to load our current working address in the `$PATH` environment variable.   
This change can be executed by doing something like:   

```bash
$ export PATH=$PATH:$HOME/workspace/training/bash/bin
$ export PATH=$PATH:.
```
So we'll have all our scripts available for execution from any address or folder. But it will be only a temporary solution, due to this will be only for the current session. For a more persistent change, edit the config file:  

```bash
$ sudo vim /etc/environment
```
**Note:** If you don't use `sudo` then for vim you'll have to close the document using: `w sudo tee %` at bottom.  

And add the working folder and the current address in Linux ` . ` to the PATH values, always separated by semicolon. In my case it looks like:  

```bash
PATH="/home/davidjguru/workspace/training/bash/bin:.:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin"
```

Finally reload the new edited file in order to charge the new values in the `$PATH` variable, checking the updating:  

```bash
$ source /etc/environment
$ echo $PATH
/home/davidjguru/workspace/training/bash/bin:.:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin
```

## Folders 

Summary of folders and resources contained in this repository.  

### Initial 

Contains simple "Hello World" scripting, with some variations using parameters. 
  * hello1.sh - Show "Hello World" by prompt.
  * hello2.sh - Show salute using $1 param from prompt.
  * hello3.sh - Show salute using $* for all params from prompt.
  * hello4.sh - Show salute using $0 as script naming parameter.
  * hello5.sh - Show salute using $0, $* and `basename` command.
  * hello6.sh - Show salute counting provided parameters with $*.

### Variables

Contains scripts that work with variables in different ways. Let's see.     
  * variables1.sh - Creating variables defined by the user.   
  * variables2.sh - Working with arrays: define, get/set item, unset, size and loop. Also examples with `declare` command.    
