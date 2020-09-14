#!/usr/bin/lua5.3

lgi = require 'lgi'--подключения модуля lgi

gtk = lgi.Gtk
gtk.init()--инициализация библиотеки gtk

bld = gtk.Builder()--создание нового экземпляра построителя интерфейса
bld:add_from_file('lab-02.glade')--загрузка описания интерфейса

ui = bld.objects

function a_b(...)
a = tonumber(ui.ent_a.text)
b = tonumber(ui.ent_b.text)
res = tonumber(ui.lbl_res.label)
end

function ui.btn_deg_rad:on_clicked()--в градусах или радианах
if ui.btn_deg_rad.label == 'deg' then
ui.btn_deg_rad.label = 'rad'
else
ui.btn_deg_rad.label = 'deg'
end; 
end

function ui.btn_add:on_clicked(...)
a_b()
ui.lbl_res.label = a+b
end

function ui.btn_sub:on_clicked(...)
a_b()
ui.lbl_res.label = a-b
end

function ui.btn_mul:on_clicked(...)
a_b()
ui.lbl_res.label = a*b
end

function ui.btn_div:on_clicked(...)
a_b()
ui.lbl_res.label = a/b
end

function ui.btn_pi:on_clicked(...)
ui.ent_a.text = math.pi
ui.ent_b.text = math.pi
--ui.btn_b.visible = false
--[[if ui.ent_a:on_activate then
ui.ent_a.text = math.pi;
elseif ui.ent_b == Gtk_select then
ui.ent_b.text = math.pi;
end;
]]
end

function ui.btn_e:on_clicked()
ui.ent_a.text = 2.7182818284590452353602874713527
ui.ent_b.text = 2.7182818284590452353602874713527
end

function ui.btn_clear:on_clicked()
ui.ent_a.text = ''
ui.ent_b.text = ''
ui.lbl_res.label = 0
end

function ui.btn_expon:on_clicked()
a_b()
ui.lbl_res.label = math.pow(a, b)
end

function ui.btn_radical:on_clicked()

end

function ui.btn_fact:on_clicked()
a_b()
if a == 1 then
a = 1
else
for i = a, 2, -1 do
a = a*(i-1)
end;
end;
ui.lbl_res.label = a
end

function ui.btn_mod:on_clicked()
a_b()
ui.lbl_res.label = a%b
end

function ui.btn_abs:on_clicked()
ui.ent_a.text = math.abs(ui.ent_a.text)
ui.ent_b.text = math.abs(ui.ent_b.text)
ui.lbl_res.label = 0
end

function ui.btn_plus_minus:on_clicked()
a_b()
if a<0 then
ui.ent_a.text = math.abs(a)
else
ui.ent_a.text = -a
end

if b<0 then
ui.ent_b.text = math.abs(b)
else
ui.ent_b.text = -b
end

ui.lbl_res.label = 0
end

function ui.btn_log:on_clicked()
a_b()
ui.lbl_res.label = math.log10(a) 
end

function ui.btn_ln:on_clicked()
a_b()
ui.lbl_res.label = math.log(a)
end

function ui.btn_sin:on_clicked()
a_b()
if ui.btn_deg_rad.label == 'deg' then
a = math.rad(a)
ui.lbl_res.label = math.sin(a)
else
ui.lbl_res.label = math.sin(a)
end
end

function ui.btn_cos:on_clicked()
a_b()
if ui.btn_deg_rad.label == 'deg' then
a = math.rad(a)
ui.lbl_res.label = math.cos(a)
else
ui.lbl_res.label = math.cos(a)
end
end

function ui.btn_tg:on_clicked()
a_b()
if ui.btn_deg_rad.label == 'deg' then
a = math.rad(a)
ui.lbl_res.label = math.tan(a)
else
ui.lbl_res.label = math.tan(a)
end
end

function ui.btn_ctg:on_clicked()
a_b()
if ui.btn_deg_rad.label == 'deg' then
a = math.rad(a)
ui.lbl_res.label = 1/math.tan(a)
else
ui.lbl_res.label = 1/math.tan(a)
end
end

function ui.btn_sec:on_clicked()
a_b()
if ui.btn_deg_rad.label == 'deg' then
a = math.rad(a)
ui.lbl_res.label = 1/math.cos(a)
else
ui.lbl_res.label = 1/math.cos(a)
end
end

function ui.btn_csc:on_clicked()
a_b()
if ui.btn_deg_rad.label == 'deg' then
a = math.rad(a)
ui.lbl_res.label = 1/math.sin(a)
else
ui.lbl_res.label = 1/math.sin(a)
end
end

ui.wnd.title = 'lab-02'--задание названия главного окна
ui.wnd.on_destroy = gtk.main_quit--выход из цикла обработки событий при закрытии окна
ui.wnd:show_all()--отображение главного окна и его элементов

gtk.main()--запуск цикла обработки событий
