# Personal configs
These are my personal configuration files for ```tmux```, ```vim``` and ```git```. It's tested on Mac OS and Ubuntu.

If you want to use it you have to run it like this. **THIS WILL BREAK YOUR CURRENT CONFIG**:
```bash
make install \
    EMAIL=YOUR@email.com 
```
This will install all configuration files.
If you want to install a specific configuration you can alternatively run: 
 - ```make install tmux```
 - ```make install vim```
 - ```make install git```
 
Each target is configurable through environments variables, look in ```Makefile``` file to see what can you do.

## Dependencies
 - make
 - m4
 - git, tmux, vim installed
