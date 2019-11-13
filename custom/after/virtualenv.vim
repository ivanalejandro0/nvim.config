" thanks to: https://github.com/swaroopch/dotvim/blob/master/vimrc
" if has('python') " Assumes Python >= 2.6 "
"
" " Add the virtualenv's site-packages to vim path
" python << EOF
" import os.path
" import sys
" import vim
" if 'VIRTUAL_ENV' in os.environ:
"     project_base_dir = os.environ['VIRTUAL_ENV']
"     sys.path.insert(0, project_base_dir)
"     activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"     execfile(activate_this, dict(__file__=activate_this))
" EOF
"
" endif " python
