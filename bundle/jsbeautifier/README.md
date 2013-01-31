Clone de jsbeautifier repo:
$ git clone https://github.com/einars/js-beautify.git

JS-Beautify all the file:
:!~/.vim/bundle/jsbeautifier/js-beautify/python/js-beautify 

In selection:
!~/.vim/bundle/jsbeautifier/js-beautify/python/js-beautify -i

must look like this:
:'<,'>!~/.vim/bundle/jsbeautifier/js-beautify/python/js-beautify -i

Only needed the python version, you can keep only the: js-beautify/python folder like this
cd ~/.vim/bundle/jsbeautifier/js-beautify/
mv python ../js-beautify.py

and now call like:
!~/.vim/bundle/jsbeautifier/js-beautify.py/js-beautify -i


Para ponerlo en el .vimrc:
vmap gb :!~/.vim/bundle/jsbeautifier/js-beautify.py/js-beautify -i<CR>

Thanks to: http://spoygg.com/2011/how-to-format-indent-beautify-javascript-in-vim/
