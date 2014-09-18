#! /usr/bin/env python 
# -*- coding:utf-8 -*-
# 
# written by Shotaro Fujimoto, May 2014.
#

from Tkinter import *

class SetParameter():
    def show_setting_window(self, parameters, command):
        root=Tk()
        root.title('Parameter')
        root.minsize(170, 50)
        root.maxsize(200, 250)
        frame=Frame(root, padx=5, pady=5)
        frame.pack()
        self.entry=[]
        for i, parameter in enumerate(parameters):
            label=Label(frame, text=parameter + ' = ')
            label.grid(row=i, column=0, sticky=E)
            self.entry.append(Entry(frame, width=10))
            self.entry[i].grid(row=i, column=1)
        self.entry[0].focus_set()
        button=Button(frame, text='OK', command=command)
        button.grid(row=len(parameters), column=0, columnspan=2, sticky=E+W)
        root.mainloop()

