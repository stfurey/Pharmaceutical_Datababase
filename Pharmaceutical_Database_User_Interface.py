import sqlite3
import re
import time


def mainenu():
    options = input("What are you looking to find today(Enter number)?"
                    "\n 1. Medicine"
                    "\n 2. Employee"
                    "\n 3. Customer \n")
    if options == "1":
        medicineOptions()
        moreInfo()
    if options == "2":
        employeeinfo()
        moreInfo()
    if options == "3":
        customerinfo()
        moreInfo()

def medicineOptions():
    symptom = input("What kind of medicine are you looking for? ")
    conn = sqlite3.connect('/Users/Skylar/SQL_Lite_Database.db')
    cur = conn.cursor()
    cur.execute("SELECT * FROM medicine")
    medicines = cur.fetchall()
    for row in medicines:
        if row[2] == symptom:
            print(row)
    cur.close()
    del cur


def employeeinfo():
    emp = input("What employee are you looking for? ")
    conn = sqlite3.connect('/Users/Skylar/SQL_Lite_Database.db')
    cur = conn.cursor()
    cur.execute("SELECT * FROM worker")
    employees= cur.fetchall()
    for row in employees:
        if row[2] == emp:
            print (row)
    cur.close()
    del cur

def customerinfo():
    cust = input("What customer are you looking for? ")
    conn = sqlite3.connect('/Users/Skylar/SQL_Lite_Database.db')
    cur = conn.cursor()
    cur.execute("SELECT * FROM customer")
    customers= cur.fetchall()
    for row in customers:
        if row[1] == cust:
            print (row)
    cur.close()
    del cur

def moreInfo():
    redo= input("Would you like to look for something else? \n"
                "Yes\n"
                "No\n")
    if redo == "Yes":
        mainenu()
    if redo == "No":
        print()

def morePos():
    redo= input("Would you like to lookup someone else? \n"
                "Yes\n"
                "No\n")
    if redo == "Yes":
        getWorkerSetup()
    if redo == "No":
        print()

def moreSales():
    redo= input("Would you like to make another sale? \n"
                "Yes\n"
                "No\n")
    if redo == "Yes":
        saleSetup()
    if redo == "No":
        print()


def _toTitle(string):
    return str(string).title()

def getWorkerPosition(id):
        sqliteConnection = sqlite3.connect('/Users/Skylar/SQL_Lite_Database.db')
        cur = sqliteConnection.cursor()
        sqliteConnection.create_function("workPos", 1, _toTitle)
        select = "SELECT workPos(position) FROM worker where employee_num= ?"
        cur.execute(select, (id,))
        position = str(cur.fetchone())
        position2 = re.sub("[^a-zA-Z]+", "", position)
        select2 = "SELECT employee_name FROM worker where employee_num= ?"
        cur.execute(select2, (id,))
        name = str(cur.fetchone())
        name2 = re.sub("[^a-zA-Z]+", "", name)
        print("Name= ", name2, "\n", "Position= ", position2)
        cur.close()
        del cur
        morePos()


def getWorkerSetup():
    workerForP = input("Enter a worker's ID to find out who they are and what they do: ")
    getWorkerPosition(workerForP)

def sale(employee_num, customer_num, itemNum, qty):
    conn = sqlite3.connect('/Users/Skylar/SQL_Lite_Database.db')
    cur = conn.cursor()
    conn.create_function("qoh", 1, _toTitle)
    select = ("select qoh(quantity) from inventory where inventory_num= ?")
    cur.execute(select, (itemNum,))
    quantityOH = str(cur.fetchone())
    quantityOH2= int(re.sub("[^0-9]", "", quantityOH))
    if qty<= quantityOH2:
        beginSelect =("select * from inventory where inventory_num = ?")
        cur.execute(beginSelect, (itemNum,))
        oldInv = cur.fetchall()
        print(oldInv)
        cur.execute("BEGIN TRANSACTION;")
        update= ("update inventory set quantity= quantity - ? where inventory_num=?")
        cur.execute(update, (qty, itemNum,))
        endSelect = ("select * from inventory where inventory_num = ?")
        cur.execute(endSelect, (itemNum,))
        newInv = cur.fetchall()
        print(newInv)
        cur.execute("select * from sales")
        oldSales = cur.fetchall()
        print(oldSales)
        insert= ("insert into sales(sale_num, employee_num, customer_num, inventory_num, quantity)VALUES(112,?,?,?, ?)")
        cur.execute(insert, (employee_num, customer_num, itemNum, qty,))
        cur.execute("select * from sales")
        newSales = cur.fetchall()
        print(newSales)
        cur.execute("COMMIT;")
        cur.execute("delete from sales where sale_num=112")
        cur.execute("COMMIT;")
    else:
        print("There is not enough inventory in stock for this sale.")
    moreSales()
    cur.close()
    del cur

def saleSetup():
    workerForSale = input("Enter a worker's ID: ")
    customerForSale = input("Enter a customer's ID: ")
    itemForSale = input("Enter an item's ID: ")
    qtyForSale = input("How much would you like to sell: ")
    sale(workerForSale,customerForSale,itemForSale,int(qtyForSale))

def otherDemos():
    print ("Next we will demonstrate our trigger by introducing a new manager. "
           "The trigger will automatically make the manager an employee.")
    time.sleep(7)

    print("\n", "Here are all of our current managers and employees")
    time.sleep(5)
    conn = sqlite3.connect('/Users/Skylar/SQL_Lite_Database.db')
    cur = conn.cursor()
    cur.execute("select * from manager;")
    managers = cur.fetchall()
    print(managers)
    cur.execute("select * from worker;")
    workers = cur.fetchall()
    print(workers)

    time.sleep(10)
    print("\n","Now we've inserted the manager Sue")
    time.sleep(5)
    cur.execute("insert into manager(manager_num,manager_name,employee_num)values(103,'Sue',113)")
    cur.execute("select * from manager;")
    newManagers = cur.fetchall()
    print(newManagers)
    cur.execute("select * from worker;")
    newWorkers = cur.fetchall()
    print(newWorkers)
    time.sleep(10)
    #Reset to original dataset
    cur.execute("delete from manager where manager_num=103")
    cur.execute("delete from worker where employee_num=1100")

    print("\n","Next we will show you a view")
    time.sleep(4)
    print("Here are all of our products")
    time.sleep(5)
    cur.execute("select * from sales;")
    sView = cur.fetchall()
    print(sView)
    time.sleep(5)
    print("\n","Now simplified to just show each product and their quantity on hand")
    time.sleep(5)
    cur.execute("select * from simpleSales;")
    ssView = cur.fetchall()
    print(ssView)
    time.sleep(7)

    print("\n","Now we will look up employees by their ID")
    getWorkerSetup()
    time.sleep(2)
    cur.close()
    del cur


def randomQueries():
    conn = sqlite3.connect('/Users/Skylar/SQL_Lite_Database.db')
    cur = conn.cursor()

    print("\n","Find the sale # and customer # for all sales not by customer #1004: ")
    time.sleep(3)
    cur.execute("select inventory.inventory_num,sales.customer_num from sales, inventory where "
                "inventory.inventory_num = sales.inventory_num"
                " and sales.customer_num in (select customer_num from customer where customer_num <> 1004);")
    customers = cur.fetchall()
    print(customers)
    time.sleep(5)

    print("\n","Find customers whose roommates are also customers: ")
    time.sleep(3)
    cur.execute("select customer.customer_name,count(other.customer_name) from customer, customer "
                "as other where customer.address = other.address and customer.customer_name <> other.customer_name "
                "group by customer.customer_name;")
    roommates=cur.fetchall()
    print(roommates)
    time.sleep(5)

    print("\n","Find the number of employees each managers manages: ")
    time.sleep(3)
    cur.execute("select manager.manager_name as Manager, count(worker.employee_num) as Managees from manager, worker "
                "where manager.manager_num = worker.manager_num and manager.employee_num <> worker.employee_"
                "num group by manager.manager_name;")
    managees= str(cur.fetchall())
    print(managees)
    time.sleep(5)

    print("\n","Our Total Inventory is: ")
    time.sleep(3)
    cur.execute("select sum(inventory.quantity) as TotalInventory from inventory;")
    totInv=str(cur.fetchall())
    totInv2 = re.sub(r'[\W_]+', '', totInv)
    print(totInv2)
    time.sleep(5)

    print("\n","Find each employee, their position, and their manager: ")
    time.sleep(3)
    cur.execute("select worker.employee_name, worker.position, manager.manager_name from worker cross join manager "
                "where worker.manager_num = manager.manager_num;")
    basicEmp=cur.fetchall()
    print(basicEmp)
    time.sleep(5)

    print("\n","Change Manager position title to Boss: ")
    time.sleep(3)
    cur.execute("select * from worker where position= 'Manager';")
    manTitle= cur.fetchall()
    print(manTitle)
    print(" |", "\n", "V")
    cur.execute("Update worker set position = 'Boss' where position= 'Manager';")
    cur.execute("select * from worker where position= 'Boss';")
    bossTitle= cur.fetchall()
    print(bossTitle)
    #Change it back
    cur.execute("Update worker set position = 'Manager' where position= 'Boss';")
    time.sleep(5)
    cur.close()
    del cur



def main():
    mainenu()
    otherDemos()
    print("Sale mode loading...")
    time.sleep(3)
    saleSetup()
    randomQueries()


main()
