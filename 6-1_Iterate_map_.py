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
import matplotlib.pylab as plt  # 追加で必要なモジュール
from Tkinter import *
from types import *
import click


class Iterate_map():

    def __init__(self, parameters):
        self._set_parameters(parameters)
        self.parameters = dict()

    def _set_parameters(self, parameters):
        for k, v in parameters:
            self.parameters[k] = raw_input('set value for %s (default: %s): '
                                           % (k, str(v)))

    def mapping(self):  # グラフの描画
        self.nmax = int(self.entry[2].get())
        x = array.array('d')
        x.append(self.x0)
        for i in range(0, self.nmax):
            t = 4.0 * self.r * x[i] * (1 - x[i])
            x.append(t)
        n = range(self.nmax + 1)
        plt.plot(n, x,
                 label=r'$x_{0}\ =$' + str(self.x0) + ' : '
                 + r'$r\ =$' + str(self.r) + ' : '
                 + r'$n_{\mathrm{max}}\ =$' + str(self.nmax)
                 )
        plt.gca().set_xlim(0, self.nmax)
        plt.gca().set_ylim(-0.05, 1.0)
        plt.xlabel(r'$n$', fontsize=16)
        plt.ylabel(r'$x$', fontsize=16)
        plt.title('Iterate_map')
        plt.legend(loc="best")
        plt.show()

    def drawing(self):
        if self.r > 1.0 / 4.0 and self.r < 3.0 / 4.0:
            xfi = 1.0 - 1.0 / (4.0 * self.r)
            plt.plot([0, self.nmax], [xfi] * 2,
                     label=r'$x = 1 - 1 / 4r = $' + str(xfi)
                     )
            plt.legend(loc="best")
            plt.show()
        else:
            pass

if __name__ == '__main__':

    parameters = {'x0': 0.2, 'r': 0.74, 'nmax': 100}  # 設定するパラメータ
    run = Iterate_map()
