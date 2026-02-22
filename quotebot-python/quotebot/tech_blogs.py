import time
import tkinter as tk
from tkinter import messagebox


class TechBlogs:

    @staticmethod
    def list_all_blogs():
        try:
            time.sleep(5)  # Access to DB are very slow
        except Exception as e:
            root = tk.Tk()
            root.withdraw()
            messagebox.showwarning("Unxepceted ecxeptoin", str(e))
            root.destroy()
        return ["HackerNews", "Reddit", "TechCrunch", "BuzzFeed",
                "TMZ", "TheHuffPost", "GigaOM"]
