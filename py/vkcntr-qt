#!/usr/bin/env python3
import sys
import datetime
import signal
import time
from PySide6 import QtCore, QtWidgets, QtGui

today = datetime.date.today()
current_year = datetime.date.today().year
future = datetime.date(current_year, 7, 1)
diff = future - today

if diff.days == 0:
    daysleft = "Zomervakantie start vandaag. Vergeet er niet van te genieten."
elif str(diff.days).startswith("-") == True:
    daysleft = f"Nog {diff.days + 365} dag(en) tot begin zomervakantie."
else:
    daysleft = f"Nog {diff.days} dag(en) tot begin zomervakantie."

class MyWidget(QtWidgets.QWidget):
    def __init__(self):
        super().__init__()
        self.text = QtWidgets.QLabel(daysleft, alignment=QtCore.Qt.AlignCenter)
        self.layout = QtWidgets.QVBoxLayout(self)
        self.layout.addWidget(self.text)

if __name__ == "__main__":
    app = QtWidgets.QApplication([])
    app.setStyleSheet("QLabel{font-size: 18pt;}")
    widget = MyWidget()
    widget.resize(600, 400)
    widget.show()
    sys.exit(app.exec())
