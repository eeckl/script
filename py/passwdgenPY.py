import random
import string

print("Hello, welcome to Lowie's password generator (written in Python).")

length = int(input("\nEnter the length of the password: "))

lower = string.ascii_lowercase
upper = string.ascii_uppercase
num = string.digits
symbols = string.punctuation

prompt_nums = input("Do you want numbers in your password? (y/n) ")
prompt_symbols = input("Do you want symbols in your password? (y/n) ")

if prompt_nums == "y" and prompt_symbols == "y":
	all = lower + upper + num + symbols
if prompt_nums == "n" or prompt_symbols == "n":
	all = lower + upper
if prompt_nums == "y" and prompt_symbols == "n":
	all = lower + upper + num
if prompt_nums == "n" and prompt_symbols == "y":
	all = lower + upper + symbols

temp = random.sample(all, length)

password = "".join(temp)

print(password)