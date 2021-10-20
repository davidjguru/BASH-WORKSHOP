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

### 01. Initial 

Contains simple "Hello World" scripting, with some variations using parameters. 
  * hello1.sh - Show "Hello World" by prompt.
  * hello2.sh - Show salute using $1 param from prompt.
  * hello3.sh - Show salute using $* for all params from prompt.
  * hello4.sh - Show salute using $0 as script naming parameter.
  * hello5.sh - Show salute using $0, $* and `basename` command.
  * hello6.sh - Show salute counting provided parameters with $*.

### 02. Variables

Contains scripts that work with variables in different ways. Let's see.     
  * variables1.sh - Creating variables defined by the user.   
  * variables2.sh - Working with arrays: define, get/set item, unset, size and loop. Uses `declare` command.
  * variables3.sh - Test environment variables and check the scope of a variable between scripts.
  * variables3_secondary.sh - Gives support to the previous variables3.sh script.     

### 03. Parameters

Contains scripts and resources that working with parameters from console and reading values in prompt. 
  * greetings1.sh - Takes input from console, read and return a response.  
  * greetings2.sh - Read the input using the `read -p` command and option.  

### 04. Utilites

This folder stores some tools based in bash, little interesting scripts to perform common automatic tasks.  
  * druclinic.sh - Executes some basic inspections within a standarized Drupal folder and get values.  