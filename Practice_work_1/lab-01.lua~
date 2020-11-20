#!/usr/bin/lua5.3

lgi = require 'lgi' --подключение модуля lgi

gtk = lgi.Gtk
gtk.init() --инициализация библиотеки gtk

bld = gtk.Builder() --создание нового экземпляра построителя интерфейсов
bld:add_from_file('lab-01.glade') --загрузка описания интерфейса

ui = bld.objects

ui.wnd.title = 'lab-01' --задание названия главного окна
ui.wnd.on_destroy = gtk.main_quit --выход из цикла обработки событий при закрытии окна
ui.wnd:show_all() --отображение главного окна и его элементов

gtk.main() --запуск цикла обработки событий интерфейса
