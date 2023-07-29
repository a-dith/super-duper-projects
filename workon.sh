# shell-script-to-do-shell-scripting-fast
# https://www.theunixschool.com/2011/08/shell-script-to-do-shell-scripting.html
#!/usr/bin/bash

if [ ! -f $1 ]; then
  echo "#!/usr/bin/bash" > $1
fi

while [ 1 ];
do
        nano $1
        chmod 755 $1
        ./$1
        read dummy
done
