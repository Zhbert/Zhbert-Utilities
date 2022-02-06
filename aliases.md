Добавляем alias на приложеньки
==============================

Выкачать с диска архив с приложениями с положить его в `~`, то есть должен получиться каталог `~/bin`.

Добавить в конец `~/.bashrc` строчки: 

```shell
#my aliases
alias downcaser='java -jar ~/bin/downcaser-1.0.jar'
alias jekyll_gen='~/bin/jekyll_post_template_generator'
```

Применить изменения компандой `source ~/.bashrc`.
