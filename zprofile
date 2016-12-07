# load virtualenvwrapper for python (after custom PATHs)
venvwrap="virtualenvwrapper.sh"
if [ $? -eq 0 ]; then
    venvwrap=`/usr/bin/which $venvwrap`
    source $venvwrap
fi
