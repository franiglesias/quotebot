import tkinter as tk
from tkinter import messagebox


class QuotePublisher:

    _instance = None

    def __new__(cls):
        if cls._instance is None:
            cls._instance = super(QuotePublisher, cls).__new__(cls)
        return cls._instance

    def publish(self, today_price):
        root = tk.Tk()
        root.withdraw()
        messagebox.showwarning(
            "Big fail!",
            "You've pushed a dummy auction to a real ads platform, the business is upset!"
        )
        root.destroy()


INSTANCE = QuotePublisher()
