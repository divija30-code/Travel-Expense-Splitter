# 💸 Multi-User Travel Expense Splitter with Transaction Tracking

A functional programming project built with **Haskell** that simplifies group travel 
expense management. No more confusion over who paid what — just enter the expenses 
and let the program handle the math!

## 📌 About the Project

When travelling in groups, different people pay for different things — food, cab, 
hotel, shopping and so on. This tool helps you:

- Record multiple expenses across multiple users
- Track who paid for what and how much
- Calculate the total contribution of each person
- Split the total cost **equally** among all members
- Display the **final settlement** — who owes whom

Built using **Haskell** as part of the *Principles of Functional Language (23CSE212)* 
course at **Amrita Vishwa Vidyapeetham, Nagercoil**.

## 🛠️ Tech Stack

| Component | Details |
|-----------|---------|
| Language | Haskell |
| Compiler | GHC (Glasgow Haskell Compiler) |
| Key Concepts | `Data.Map`, higher-order functions, pure functions, immutable data, `foldl` |

## 🚀 How to Run
```bash
# Compile the program
ghc -o expense_splitter main.hs

# Run the program
./expense_splitter
```

## 📊 Features

- ✅ Accepts multiple expense entries
- ✅ Groups transactions by person
- ✅ Calculates total spent per user
- ✅ Computes equal share for all members
- ✅ Shows who needs to pay or receive money

## 📷 Sample Output
```
Person A paid total ₹10100
Person B paid total ₹5500
Person C paid total ₹5900

--- Final Settlement ---
A receives money
B pays A
C pays A
```

## 🔮 Future Enhancements

- Add a GUI or web interface
- Support unequal/percentage-based splitting
- Persistent storage using files or a database
- Mobile application version

## 👩‍💻 Author

**P. Durga Divija Sri Sai**  
B.Tech CSE, IV Semester  
Amrita Vishwa Vidyapeetham, Nagercoil

---

> *"Splitting bills, not friendships."* 😄
