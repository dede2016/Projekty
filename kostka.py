from random import randint
import tkinter
from tkinter import messagebox

rgracz = 0
rkomp = 0
gracz = 0
komp = 0
top = tkinter.Tk()
top.resizable(width = False, height =False)
top.geometry("300x200")


def Play():
    global gracz
    global komp
    rgracz = randint(1, 6)
    rkomp = randint(1, 6)
    message = ""
    if rgracz > rkomp:
        message = "wygrałeś rundę!"
        gracz += 1
    elif rgracz == rkomp:
        message = "remis"
    else:
        message = "przegrałeś rundę!"
        komp += 1
    messagebox.showinfo("Wynik", "Ty: " + str(gracz) + "     Komputer: " + str(komp) + "\nWyrzuciłeś " + str(
        rgracz) + "\n" + "Komputer wyrzucił  " + str(rkomp) + "\n" + message)


def Quit():
    top.quit()

B1 = tkinter.Button(top, text="Tak", command=Play, width=15)
B2 = tkinter.Button(top, text="Nie", command=Quit, width=15)
w = tkinter.Label(top, text="Czy chcesz zagrać zagrać w kości?\n")
w.grid(row=0, column=0)
B1.grid(row=1, column=0)
B2.grid(row=1, column=1)

top.mainloop()