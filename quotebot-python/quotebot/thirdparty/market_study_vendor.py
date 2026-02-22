import os
import random
import tkinter as tk
from tkinter import messagebox


class MarketStudyVendor:

    def average_price(self, blog):
        if os.getenv("license") is None:
            root = tk.Tk()
            root.withdraw()
            messagebox.showwarning("Stupid license", "Missing license !")
            root.destroy()
            raise RuntimeError("")
        return hash(blog) * random.random()
