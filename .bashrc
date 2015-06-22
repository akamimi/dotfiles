export IBM_DB_HOME="/opt/ibm/db2/V9.7"

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# User specific aliases and functions

# The following three lines have been added by UDB DB2.
if [ -f /home/develop/sqllib/db2profile ]; then
  . /home/develop/sqllib/db2profile
fi

alias mysql="mysql --pager='less -S -n -i -F -X' "
