# BASH-WORKSHOP
Storage for some scripts used in the Bash Scripting Workshop (2021 - 2022).   

## Initial Steps 

### Executing your scripts from any folder  

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

### Executing automated testing for your scripts

You can do Testing Driven Development in Bash (TDD) using a tool called "Bats". This will allow you to enable test and check your bash code.  
* [https://bats-core.readthedocs.io/](https://bats-core.readthedocs.io/)   
* [https://github.com/bats-core/bats-core](https://github.com/bats-core/bats-core)   
  
Installing in Ubuntu:  

```bash
$ git clone https://github.com/bats-core/bats-core.git
$ cd bats-core
$ sudo ./install.sh /usr/local
```

Testing Usage:  
After installation you can view manual pages with: `man 1 bats` (usage manual) and `man 7 bats` (writing test files manual). 
Also, you can view the available command line options that Bats supports by calling Bats with the `-h` or `--help`.  

When you finished an iteration over your script -having your defined tests- launch the tests by doing:  

```bash
$ bats two_fer.bats 
```

### Debugging your scripts 

Just like in others languages, you can do some debugging in your IDE. For VSCode, you can install the `rogalmic.bash-debug` extension and after install it, you only have to enable the classical `launch.json`file in the root of your folder, just inside a new folder `vscode`.  

```json
{
    "version": "0.2.0",
    "configurations": [
        {
            "name": "Bash-Debug",
            "type": "bashdb",
            "request": "launch",
            "program": "${command:SelectScriptName}",
            "commandLineArguments": "",
            "linux": {
                "bashPath": "bash"
            }
        }
    ]
}
```

Then you'll can enable debugging putting some breakpoints in your code and calling F5.  

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

**Sandbox:** Contain some exercises as  
  * hello_world.sh / hello_world.bats  

### 02. Variables

Contains scripts that work with variables in different ways. Let's see.     
  * variables1.sh - Creating variables defined by the user.   
  * variables2.sh - Working with arrays: define, get/set item, unset, size and loop. Uses `declare` command.
  * variables3.sh - Test environment variables and check the scope of a variable between scripts.
  * variables3_secondary.sh - Gives support to the previous variables3.sh script.     

### 03. Parameters

Contains scripts and resources that working with parameters from console and reading values in prompt. 
  * greetings1.sh - Takes input from console, read and return a response.  
  * greetings2.sh - Read the input using the `read -p` command and option `-p`.  
  * greetings3.sh - Read input and limiting entered characters by prompt.  
  * greetings4.sh - Read input and hiding entered characters.  
  * greetings5.sh - Read input and processing options from console.  

**Sandbox:** Contain some exercises as  
  * error_handling.sh / error_handling.bats  
  
### 04. Conditions and Loops

**Sandbox:** Contain some exercises as  
  * acronym.sh / acronym.bats  
  * raindrop.sh / raindrop.bats  
### 05. Utilites

This folder stores some tools based in bash, little interesting scripts to perform common automatic tasks.  
  * bashup.sh - Execute backups for files managing extensions and folders.  
  * druclinic.sh - Executes some basic inspections within a standarized Drupal folder and get values.  
  * bashware.sh - Get a summary about hardware from bash.  
  * bashdom.sh - Gathering random commands for a Linux distribution.  
  * bashing.sh - aunch ping from console to remote server.  

### 06. Reading Materials


## Remember
Here are some useful tables with interesting information to remember when you'll build some stuff for bash.  

### Positional Parameters

| Option | Description |
--------|-------------|
| $! | Return the PID of the most recent command. |
| $? | Gets the most recent exit status |
| $0 | Represents the command or script. |
| $1 to $9 | Represents arguments 1 through 9. |
| ${10} and so on| Represents arguments from item 10 and further. |
| $# | Represents the total number of arguments. |
| $* | Represents all arguments expanded as all parameters added together. |
| $@ | Represents all arguments expanded as a list of separated parameters. |
| $$ | Represents the PID of the current shell. |

**More Info:**  
  * [https://bash.cyberciti.biz/guide/How_to_use_positional_parameters](https://bash.cyberciti.biz/guide/How_to_use_positional_parameters)  
  * [https://www.gnu.org/software/bash/manual/html_node/Variable-Index.html#Variable-Index_vr_symbol-3](https://www.gnu.org/software/bash/manual/html_node/Variable-Index.html#Variable-Index_vr_symbol-3)  
  * [https://www.gnu.org/software/bash/manual/html_node/Special-Parameters.html](https://www.gnu.org/software/bash/manual/html_node/Special-Parameters.html)  

### Standard for Options  

These are some of the commonly used options when you're implementing options for your custom command / function in Bash. 

| Option | Description |
--------|-------------|
| -a | List all items. |
| -c | Get a count of all items. |
| -d | Output directory. |
| -e | Expand items. |
| -f | Specify a file. |
| -h | Show the help page. |
| -i | Ignore the character case. |
| -l | List a text. |
| -o | Send output to a file. |
| -q | Keep silent; don't ask the user. |
| -r | Process something recursively. |
| -s | Use stealth mode. |
| -v | Use verbose mode. |
| -x | Specify an executable. |
| -y | Accept without prompting me. |