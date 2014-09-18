#! usr/bin/env python 
# coding:utf-8
#
# written by Shotaro Fujimoto, May 2014.
#
""" 計算機実習
問題6.1 周期倍化
プログラムを実行すると、パラメータの設定ダイアログが開き、
OKボタンを押すとグラフが描画される。

"""

import array as array
import matplotlib.pylab as plt # 追加で必要なモジュール
from Tkinter import *

class Iterate_map():
    def __init__(self):
        self.show_setting_window()
    
    def judge(self):
        self.x0=float(self.entry[0].get())
        self.r=float(self.entry[1].get())
        if self.x0 < 0 or self.x0 > 1 or self.r < 0 or self.r > 1:
            self.toplevel=Toplevel()
            if self.x0 < 0 or self.x0 > 1:    
                s="条件: 0 <= x0 <= 1 を満たしていません。"
                Label(self.toplevel, text=s).pack(padx=10, pady=5)
            if self.r < 0 or self.r > 1:
                s="条件: 0 <= r <= 1 を満たしていません。"
                Label(self.toplevel, text=s).pack(padx=10, pady=5)
            self.toplevel.grab_set()
            button=Button(self.toplevel, text='OK', command=self.close)
            button.pack(pady=5)
        else: self.mapping()
    def close(self):
        self.toplevel.destroy()
    
    def show_setting_window(self):
        parameters=['x0', 'r', 'nmax'] # 設定するパラメータ
        root=Tk()
        frame=Frame(root, padx=5, pady=5)
        frame.pack()
        label=Label(frame, text='setting parameter')
        label.grid(row=0, column=0, columnspan=2)
        self.entry=[]
        for i, parameter in enumerate(parameters):
            label=Label(frame, text=parameter + ' = ')
            label.grid(row=i+1, column=0, sticky=E)
            self.entry.append(Entry(frame, width=10))
            self.entry[i].grid(row=i+1, column=1)
        self.entry[0].focus_set()
        button=Button(frame, text='OK', command=self.judge)
        button.grid(row=4, column=0, columnspan=2, sticky=E+W)
        button=Button(frame, text='add attractor', command=self.drawing)
        button.grid(row=5, column=0, columnspan=2, sticky=E+W)
        root.mainloop()
    
    def mapping(self): # グラフの描画
        self.nmax=int(self.entry[2].get())
        x=array.array('d')
        x.append(self.x0)
        for i in range(0, self.nmax):
            t = 4.0*self.r*x[i]*(1-x[i])
            x.append(t)
        n=range(self.nmax + 1)
        plt.plot(n, x, 
                label= r'$x_{0}\ =$' + str(self.x0) + ' : ' 
                     + r'$r\ =$' + str(self.r) + ' : '
                     + r'$n_{\mathrm{max}}\ =$' + str(self.nmax)
                )
        plt.gca().set_xlim(0,self.nmax)
        plt.gca().set_ylim(-0.05,1.0)
        plt.xlabel(r'$n$', fontsize=16)
        plt.ylabel(r'$x$', fontsize=16)
        plt.title('Iterate_map')
        plt.legend(loc="best")
        plt.show()
    
    def drawing(self):
        if self.r > 1.0/4.0 and self.r < 3.0/4.0:
            xfi=1.0-1.0/(4.0*self.r)
            plt.plot([0, self.nmax], [xfi]*2, 
                    label=r'$x = 1 - 1 / 4r = $' + str(xfi)
                    )
            plt.legend(loc="best")
            plt.show()
        else: pass

if __name__ == '__main__':
    run = Iterate_map()

