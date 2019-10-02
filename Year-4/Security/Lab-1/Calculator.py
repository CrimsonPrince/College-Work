#
# Requires GTK3 to RUN
#

import gi

#Setting GI version
gi.require_version("Gtk", "3.0")

#Import GTK For UI
from gi.repository import Gtk

#Class than contains the visualizations for the Calculator
class calculatorDisplay(Gtk.Window):

    #Init Tasks
    def __init__(self):
        Gtk.Window.__init__(self, title="Calculator")
        self.set_border_width(10)
        outerBox = Gtk.HBox()
        self.add(outerBox)

        #Defines Box
        numbersBox = Gtk.VBox()
        outerBox.pack_start(numbersBox, True, True, 0)

        #Draws First Row of Buttons
        row1 = Gtk.Box()
        numbersBox.pack_start(row1, True, True, 0)

        self.m_bufferTvView = Gtk.TextBuffer()
        tvView = Gtk.TextView(buffer=self.m_bufferTvView)
        row1.pack_start(tvView, True, True, 0)

        row2 = Gtk.Box()
        numbersBox.pack_start(row2, True, True, 0)

        #Draws button 0 - 9
        button = Gtk.Button.new_with_label("1")
        button.connect("clicked", self.appBtnLbl)
        row2.pack_start(button, True, True, 0)

        button = Gtk.Button.new_with_label("2")
        button.connect("clicked", self.appBtnLbl)
        row2.pack_start(button, True, True, 0)

        button = Gtk.Button.new_with_label("3")
        button.connect("clicked", self.appBtnLbl)
        row2.pack_start(button, True, True, 0)

        row3 = Gtk.Box()
        numbersBox.pack_start(row3, True, True, 0)

        button = Gtk.Button.new_with_label("4")
        button.connect("clicked", self.appBtnLbl)
        row3.pack_start(button, True, True, 0)

        button = Gtk.Button.new_with_label("5")
        button.connect("clicked", self.appBtnLbl)
        row3.pack_start(button, True, True, 0)


        button = Gtk.Button.new_with_label("6")
        button.connect("clicked", self.appBtnLbl)
        row3.pack_start(button, True, True, 0)

        row4 = Gtk.Box()
        numbersBox.pack_start(row4, True, True, 0)

        button = Gtk.Button.new_with_label("7")
        button.connect("clicked", self.appBtnLbl)
        row4.pack_start(button, True, True, 0)


        button = Gtk.Button.new_with_label("8")
        button.connect("clicked", self.appBtnLbl)
        row4.pack_start(button, True, True, 0)

        button = Gtk.Button.new_with_label("9")
        button.connect("clicked", self.appBtnLbl)
        row4.pack_start(button, True, True, 0)

        row5 = Gtk.Box()
        numbersBox.pack_start(row5, True, True, 0)

        button = Gtk.Button.new_with_label("0")
        button.connect("clicked", self.appBtnLbl)
        row5.pack_start(button, True, True, 0)


        #Draws Symbols
        controllersBox = Gtk.VBox()
        outerBox.pack_start(controllersBox, True, True, 0)

        button = Gtk.Button.new_with_label("c")
        button.connect("clicked", self.onClickClear)
        controllersBox.pack_start(button, True, True, 0)

        button = Gtk.Button.new_with_label("+")
        button.connect("clicked", self.appBtnLbl)
        controllersBox.pack_start(button, True, True, 0)

        button = Gtk.Button.new_with_label("-")
        button.connect("clicked", self.appBtnLbl)
        controllersBox.pack_start(button, True, True, 0)

        button = Gtk.Button.new_with_label("/")
        button.connect("clicked", self.appBtnLbl)
        controllersBox.pack_start(button, True, True, 0)

        button = Gtk.Button.new_with_label("*")
        button.connect("clicked", self.appBtnLbl)
        controllersBox.pack_start(button, True, True, 0)

        button = Gtk.Button.new_with_label("=")
        button.connect("clicked", self.btnEquals)
        controllersBox.pack_start(button, True, True, 0)

    def show(self):
        self.connect("destroy", Gtk.main_quit)
        #Draws
        self.show_all()

        Gtk.main()

    def append(self, textToAppend):
        end_iter = self.m_bufferTvView.get_end_iter()
        self.m_bufferTvView.insert(end_iter, textToAppend)
    
    def getText(self):
        return self.m_bufferTvView.get_text(self.m_bufferTvView.get_start_iter(), self.m_bufferTvView.get_end_iter(), False)


    def appBtnLbl(self, btn):
        self.append(btn.get_label())

    #Clear Function for C
    def onClickClear(self, btn):
        self.clear()

    def clear(self):
        self.m_bufferTvView.set_text("")

    def btnEquals(self, btn):

        calculator = Calculator()

        stringToCalc = self.getText()

        sSolution = str(calculator.calculateByString(stringToCalc))

        self.clear()

        self.append(sSolution)

#Calculator Class that contains all the functionality
class Calculator():

    def calculateByString(self, stringToCalcBy):
        calcEqu = self.parseStringToEquation(stringToCalcBy)
        return self.solveEquation(calcEqu)

    def solveEquation(self, equation):
        solution = None
        
        curMod = ""

        for variable in equation.variableList:
            if variable.isModifer == False:
                if solution == None:
                    solution = int(variable.value)
                else:
                    curInt = int(variable.value)
                    #Checks Symbol
                    if curMod == "+":
                        solution = solution + curInt
                    elif curMod == "-":
                        solution = solution - curInt
                    elif curMod == "*":
                        solution = solution * curInt
                    elif curMod == "/":
                        solution = solution / curInt
            else:
                curMod = variable.value

        return solution

    def parseStringToEquation(self, stringToParse):
        symbols = ["*", "+", "-", "/"]
        
        result = calcEquation()

        Variables = list(stringToParse)

        current = None
        for char in Variables:
            if current == None:
                current = calcVariable()
            
            if char in symbols:
                result.variableList.append(current)
                current = calcVariable()

                current.value += str(char)
                current.isModifer = True
                result.variableList.append(current)
                current = None
            else:
                current.value += char
        if current != None:
            result.variableList.append(current)

        return result

class calcVariable():
    def __init__(self):
        self.value = ""
        self.isModifer = False

class calcEquation(): 
    def __init__(self):
        self.variableList = []

window = calculatorDisplay()
window.show()