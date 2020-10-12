Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 22838
Server version: 8.0.17 MySQL Community Server - GPL

Copyright (c) 2000, 2019, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> use sf7666
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> describe store;
+-------------+----------+------+-----+---------+-------+
| Field       | Type     | Null | Key | Default | Extra |
+-------------+----------+------+-----+---------+-------+
| store_name  | char(30) | NO   | PRI | NULL    |       |
| manager_num | int(11)  | YES  |     | NULL    |       |
| Address     | char(30) | YES  |     | NULL    |       |
| Phone       | char(15) | YES  |     | NULL    |       |
+-------------+----------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql> describe manager;
+--------------+----------+------+-----+---------+-------+
| Field        | Type     | Null | Key | Default | Extra |
+--------------+----------+------+-----+---------+-------+
| manager_num  | int(11)  | NO   | PRI | NULL    |       |
| Manager_name | char(10) | YES  |     | NULL    |       |
| Employee_num | int(11)  | YES  | MUL | NULL    |       |
+--------------+----------+------+-----+---------+-------+
3 rows in set (0.01 sec)

mysql> describe worker;
+---------------+----------+------+-----+---------+-------+
| Field         | Type     | Null | Key | Default | Extra |
+---------------+----------+------+-----+---------+-------+
| employee_num  | int(11)  | NO   | PRI | NULL    |       |
| manager_num   | int(11)  | YES  | MUL | NULL    |       |
| employee_name | char(10) | YES  |     | NULL    |       |
| Position      | char(15) | YES  |     | NULL    |       |
+---------------+----------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql> describe customer;
+---------------+----------+------+-----+---------+-------+
| Field         | Type     | Null | Key | Default | Extra |
+---------------+----------+------+-----+---------+-------+
| customer_num  | int(11)  | NO   | PRI | NULL    |       |
| customer_name | char(10) | YES  |     | NULL    |       |
| Address       | char(30) | YES  |     | NULL    |       |
+---------------+----------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> describe medicine;
+-------------------+----------+------+-----+---------+-------+
| Field             | Type     | Null | Key | Default | Extra |
+-------------------+----------+------+-----+---------+-------+
| ndc_num           | int(11)  | NO   | PRI | NULL    |       |
| manufacturer_name | char(20) | NO   | MUL | NULL    |       |
| type              | char(30) | YES  |     | NULL    |       |
| name              | char(15) | YES  |     | NULL    |       |
| Inventory_num     | int(11)  | YES  | MUL | NULL    |       |
+-------------------+----------+------+-----+---------+-------+
5 rows in set (0.00 sec)

mysql> describe sales;
+---------------+---------+------+-----+---------+-------+
| Field         | Type    | Null | Key | Default | Extra |
+---------------+---------+------+-----+---------+-------+
| sale_num      | int(11) | NO   | PRI | NULL    |       |
| employee_num  | int(11) | YES  | MUL | NULL    |       |
| customer_num  | int(11) | YES  | MUL | NULL    |       |
| inventory_num | int(11) | YES  | MUL | NULL    |       |
| quantity      | int(11) | YES  |     | NULL    |       |
+---------------+---------+------+-----+---------+-------+
5 rows in set (0.00 sec)

mysql> describe purchases;
+-------------------+----------+------+-----+---------+-------+
| Field             | Type     | Null | Key | Default | Extra |
+-------------------+----------+------+-----+---------+-------+
| order_num         | int(11)  | NO   | PRI | NULL    |       |
| manufacturer_name | char(20) | YES  | MUL | NULL    |       |
| inventory_num     | int(11)  | YES  | MUL | NULL    |       |
| quantity          | int(11)  | YES  |     | NULL    |       |
+-------------------+----------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql> describe inventory;
+---------------+---------+------+-----+---------+-------+
| Field         | Type    | Null | Key | Default | Extra |
+---------------+---------+------+-----+---------+-------+
| inventory_num | int(11) | NO   | PRI | NULL    |       |
| quantity      | int(11) | NO   |     | NULL    |       |
| ndc_num       | int(11) | YES  | MUL | NULL    |       |
+---------------+---------+------+-----+---------+-------+
3 rows in set (0.01 sec)

mysql> describe manufacturer;
+-------------------+----------+------+-----+---------+-------+
| Field             | Type     | Null | Key | Default | Extra |
+-------------------+----------+------+-----+---------+-------+
| manufacturer_name | char(20) | NO   | PRI | NULL    |       |
+-------------------+----------+------+-----+---------+-------+
1 row in set (0.00 sec)

mysql> select * from store;
+--------------------+-------------+--------------------+--------------+
| store_name         | manager_num | Address            | Phone        |
+--------------------+-------------+--------------------+--------------+
| The Best Pharmacy  |         101 | 321 Hospus Drive   | 910-555-1583 |
| The Worst Pharmacy |         102 | 43 Deceased Street | 910-555-7301 |
+--------------------+-------------+--------------------+--------------+
2 rows in set (0.00 sec)

mysql> select * from manager;
+-------------+--------------+--------------+
| manager_num | Manager_name | Employee_num |
+-------------+--------------+--------------+
|         101 | Steve        |          111 |
|         102 | Ashley       |          112 |
+-------------+--------------+--------------+
2 rows in set (0.00 sec)

mysql> select * from worker;
+--------------+-------------+---------------+------------+
| employee_num | manager_num | employee_name | Position   |
+--------------+-------------+---------------+------------+
|          111 |         101 | Steve         | Manager    |
|          112 |         102 | Ashley        | Manager    |
|          113 |         101 | Sam           | Salesman   |
|          114 |         101 | Pat           | Doctor     |
|          115 |         101 | Sally         | Receiver   |
|          116 |         101 | Helen         | Researcher |
|          117 |         102 | Danny         | Researcher |
|          118 |         102 | Harry         | Salesman   |
|          119 |         102 | Jenny         | Salesman   |
|          120 |         102 | Caroline      | Doctor     |
|          121 |         102 | Sydney        | Receiver   |
+--------------+-------------+---------------+------------+
11 rows in set (0.00 sec)

mysql> select * from customer;
+--------------+---------------+---------------------+
| customer_num | customer_name | Address             |
+--------------+---------------+---------------------+
|         1001 | Trevor        | 123 Plum Lane       |
|         1002 | Jim           | 132 Orange Street   |
|         1003 | Phil          | 152 Plum Drive      |
|         1004 | Frank         | 16 Apple Lane       |
|         1005 | Francesca     | 123 Plum Point      |
|         1006 | Howard        | 123 Grape Street    |
|         1007 | Meredith      | 341 Strawberry Lane |
|         1008 | Shelby        | 132 Orange Drive    |
|         1009 | Rebecca       | 24 Lime Lane        |
|         1010 | Omar          | 17 Blueberry Road   |
|         1011 | Jack          | 24 Lime Lane        |
+--------------+---------------+---------------------+
11 rows in set (0.00 sec)

mysql> select * from medicine;
+---------+-------------------+-----------------+-----------------+---------------+
| ndc_num | manufacturer_name | type            | name            | Inventory_num |
+---------+-------------------+-----------------+-----------------+---------------+
|  601109 | Pfizer            | Pain            | Norco           |          8837 |
|  601373 | Teva Pharma       | Thyroid         | Synthroid       |          8036 |
|  601577 | Teva Pharma       | Steroid         | Prednisone      |          8358 |
|  601772 | Merck & Co        | Allergy         | Hydroxyzine     |          8160 |
|  602127 | Merck & Co        | Cholesterol     | Lipitor         |          8677 |
|  602196 | Pfizer            | Anxiety         | Xanax           |          8287 |
|  602313 | Pfizer            | Antibiotic      | Cephalexin      |          8157 |
|  602340 | Merck & Co        | Cholesterol     | Fenofibrate     |          8853 |
|  602903 | Sanofi            | Seizure         | Gabapentin      |          8384 |
|  602930 | Alcon             | Stomach         | Nexium          |          8111 |
|  603445 | Pfizer            | Pain            | Oxycodone       |          8112 |
|  604018 | Sanofi            | Cholesterol     | Pravastatin     |          8212 |
|  604225 | Merck & Co        | Antibiotic      | Amoxicillin     |          8412 |
|  604358 | Teva Pharma       | Blood Pressure  | Lisinopril      |          8292 |
|  604962 | Norvartis         | Sleep           | Ambien          |          8785 |
|  605332 | Merck & Co        | Pain            | Ibuprofen       |          8943 |
|  606035 | Sanofi            | Cholesterol     | Atorvastatin    |          8291 |
|  607586 | Pfizer            | Blood Thinner   | Warfarin        |          8973 |
|  607752 | Teva Pharma       | Blood Pressure  | Losartan        |          8840 |
|  607888 | Teva Pharma       | Blood Pressure  | Valsartan       |          8053 |
|  608712 | Pfizer            | Iron Deficiency | Ferrous Sulfate |          8720 |
|  609092 | Sanofi            | Stomach         | Omeprazole      |          8846 |
|  609567 | Pfizer            | Stomach         | Prilosec        |          8713 |
|  609662 | Pfizer            | Cholesterol     | Simvastatin     |          8514 |
|  609877 | Zentiva           | Blood Sugar     | Lantus          |          8442 |
|  610477 | Norvartis         | Anxiety         | Prozac          |          8247 |
|  611223 | Merck & Co        | Antifungal      | Fluconazole     |          8217 |
|  616944 | Purdue Pharma     | Blood Sugar     | Metformin       |          8164 |
|  617485 | Zentiva           | Blood Pressure  | Amlodipine      |          8364 |
|  619904 | Sanofi            | Blood Pressure  | Metoprolol      |          8644 |
|  621228 | Mylan             | Antifungal      | Ketoconazole    |          8851 |
|  623272 | Alcon             | Antibiotic      | Penicillin      |          8898 |
|  634742 | Alcon             | Allergy         | Promethazine    |          8258 |
|  639657 | Sanofi            | Blood Pressure  | Atenolol        |          8997 |
|  642324 | Norvartis         | Anxiety         | Diazepam        |          8240 |
|  645620 | Merck & Co        | Blood Thinner   | Xarelto         |          8312 |
|  647481 | Norvartis         | Antifungal      | Nystatin        |          8518 |
|  648147 | Mylan             | Blood Thinner   | Eliquis         |          8073 |
|  649118 | Pfizer            | Allergy         | Cetirizine      |          8228 |
|  651363 | Teva Pharma       | Depression      | Trazodone       |          8432 |
|  656202 | Zentiva           | Sleep           | Temazepam       |          8597 |
|  656461 | Purdue Pharma     | Stomach         | Pantoprazole    |          8783 |
|  661793 | Pfizer            | Blood Pressure  | Ramipril        |          8609 |
|  665988 | Mylan             | Steroid         | Methylpred      |          8569 |
|  666098 | Mylan             | Blood Thinner   | Pradaxa         |          8021 |
|  667659 | Norvartis         | Seizure         | Phenobarbital   |          8225 |
|  674272 | Alcon             | Sleep           | Lunesta         |          8989 |
|  675366 | Zentiva           | Anxiety         | Celexa          |          8612 |
|  676422 | Purdue Pharma     | Antibiotic      | Azithromycin    |          8272 |
|  678992 | Alcon             | Depression      | Zoloft          |          8308 |
|  684145 | Norvartis         | Blood Pressure  | Spironolactone  |          8527 |
|  685714 | Sanofi            | Depression      | Venlafaxine     |          8640 |
|  690817 | Alcon             | Pain            | Tramadol        |          8952 |
|  691423 | Pfizer            | Blood Sugar     | Glipizide       |          8221 |
|  692945 | Zentiva           | Cholesterol     | Rosuvastatin    |          8572 |
|  692973 | Mylan             | Migraine        | Sumatriptan     |          8004 |
|  697882 | Merck & Co        | Antibiotic      | Bactrim         |          8955 |
+---------+-------------------+-----------------+-----------------+---------------+
57 rows in set (0.00 sec)

mysql> select * from sales;
+----------+--------------+--------------+---------------+----------+
| sale_num | employee_num | customer_num | inventory_num | quantity |
+----------+--------------+--------------+---------------+----------+
|      101 |          111 |         1004 |          8720 |        3 |
|      102 |          112 |         1002 |          8036 |        1 |
|      103 |          114 |         1008 |          8291 |        1 |
|      104 |          115 |         1011 |          8713 |        8 |
|      105 |          111 |         1003 |          8677 |        4 |
|      106 |          111 |         1004 |          8720 |        1 |
|      107 |          117 |         1007 |          8384 |        2 |
|      108 |          113 |         1006 |          8292 |        3 |
|      109 |          118 |         1006 |          8292 |        7 |
|      110 |          113 |         1004 |          8973 |        2 |
|      111 |          119 |         1002 |          8720 |        3 |
+----------+--------------+--------------+---------------+----------+
11 rows in set (0.01 sec)

mysql> select * from purchases;
+-----------+-------------------+---------------+----------+
| order_num | manufacturer_name | inventory_num | Quantity |
+-----------+-------------------+---------------+----------+
|      2220 | Teva Pharma       |          8292 |        4 |
|      3486 | Sanofi            |          8291 |        2 |
|      4276 | Pfizer            |          8157 |        4 |
|      4851 | Teva Pharma       |          8840 |        6 |
|      4914 | Pfizer            |          8837 |        3 |
|      4970 | Merck & Co        |          8943 |        6 |
|      6653 | Merck & Co        |          8853 |        5 |
|      7430 | Merck & Co        |          8412 |        2 |
|      8608 | Teva Pharma       |          8053 |        5 |
+-----------+-------------------+---------------+----------+
9 rows in set (0.00 sec)

mysql> select * from inventory;
+---------------+----------+---------+
| inventory_num | Quantity | ndc_num |
+---------------+----------+---------+
|          8004 |        2 |  692973 |
|          8021 |       12 |  666098 |
|          8036 |        3 |  601373 |
|          8053 |        7 |  607888 |
|          8073 |       12 |  648147 |
|          8111 |        8 |  602930 |
|          8112 |        2 |  603445 |
|          8157 |       14 |  602313 |
|          8160 |        7 |  601772 |
|          8164 |       10 |  616944 |
|          8212 |        2 |  604018 |
|          8217 |       15 |  611223 |
|          8221 |       15 |  691423 |
|          8225 |       18 |  667659 |
|          8228 |       20 |  649118 |
|          8240 |        8 |  642324 |
|          8247 |       20 |  610477 |
|          8258 |       10 |  634742 |
|          8272 |        7 |  676422 |
|          8287 |       17 |  602196 |
|          8291 |        8 |  606035 |
|          8292 |        4 |  604358 |
|          8308 |        8 |  678992 |
|          8312 |        8 |  645620 |
|          8358 |       14 |  601577 |
|          8364 |        2 |  617485 |
|          8384 |       20 |  602903 |
|          8412 |       14 |  604225 |
|          8432 |       13 |  651363 |
|          8442 |        9 |  609877 |
|          8514 |       21 |  609662 |
|          8518 |       15 |  647481 |
|          8527 |        8 |  684145 |
|          8569 |       13 |  665988 |
|          8572 |        3 |  692945 |
|          8597 |        2 |  656202 |
|          8609 |       11 |  661793 |
|          8612 |       12 |  675366 |
|          8640 |       12 |  685714 |
|          8644 |        9 |  619904 |
|          8677 |       16 |  602127 |
|          8713 |       15 |  609567 |
|          8720 |       12 |  608712 |
|          8783 |        4 |  656461 |
|          8785 |       12 |  604962 |
|          8837 |       21 |  601109 |
|          8840 |        2 |  607752 |
|          8846 |        2 |  609092 |
|          8851 |        9 |  621228 |
|          8853 |        5 |  602340 |
|          8898 |        6 |  623272 |
|          8943 |       16 |  605332 |
|          8952 |       15 |  690817 |
|          8955 |        9 |  697882 |
|          8973 |        2 |  607586 |
|          8989 |        9 |  674272 |
|          8997 |       12 |  639657 |
+---------------+----------+---------+
57 rows in set (0.01 sec)

mysql> select * from manufacturer;
+-------------------+
| manufacturer_name |
+-------------------+
| Merck & Co        |
| Pfizer            |
| Sanofi            |
| Teva Pharma       |
+-------------------+
4 rows in set (0.00 sec)

#Count each type of medicine
mysql> Select Type, count(*) as Quantity from medicine group by type;
+-----------------+----------+
| Type            | Quantity |
+-----------------+----------+
| Pain            |        4 |
| Thyroid         |        1 |
| Steroid         |        2 |
| Allergy         |        3 |
| Cholesterol     |        6 |
| Anxiety         |        4 |
| Antibiotic      |        5 |
| Seizure         |        2 |
| Stomach         |        4 |
| Blood Pressure  |        8 |
| Sleep           |        3 |
| Blood Thinner   |        4 |
| Iron Deficiency |        1 |
| Blood Sugar     |        3 |
| Antifungal      |        3 |
| Depression      |        3 |
| Migraine        |        1 |
+-----------------+----------+
17 rows in set (0.00 sec)

#Count orders for each manufacturer
mysql> select manufacturer_name as Manufacturer ,count(*) as OrdersComingIn from purchases group by manufacturer_name;
+--------------+----------------+
| Manufacturer | OrdersComingIn |
+--------------+----------------+
| Merck & Co   |              3 |
| Pfizer       |              2 |
| Sanofi       |              1 |
| Teva Pharma  |              3 |
+--------------+----------------+
4 rows in set (0.00 sec)

#Customers who live together
mysql> select customer.customer_name as Customer,count(other.customer_name) as Roommates from customer, customer as other where customer.address = other.address and customer.customer_name <> other.customer_name group by customer.customer_name;
+----------+-----------+
| Customer | Roommates |
+----------+-----------+
| Jack     |         1 |
| Rebecca  |         1 |
+----------+-----------+
2 rows in set (0.00 sec)

#Managees for each manager
mysql> select manager.manager_name as Manager, count(worker.employee_num) as Managees from manager, worker where manager.manager_num = worker.manager_num and manager.employee_num <> worker.employee_num group by manager.manager_name;
+---------+----------+
| Manager | Managees |
+---------+----------+
| Steve   |        4 |
| Ashley  |        5 |
+---------+----------+
2 rows in set (0.01 sec)

#Count how much of each medication has been purchased
mysql> select name as Medication,sum(sales.quantity) as Purchased from sales,inventory,medicine where sales.inventory_num = inventory.inventory_num and inventory.ndc_num= medicine.ndc_num and sales.quantity > 0 group by sales.inventory_num;
+-----------------+-----------+
| Medication      | Purchased |
+-----------------+-----------+
| Ferrous Sulfate |         7 |
| Synthroid       |         1 |
| Atorvastatin    |         1 |
| Prilosec        |         8 |
| Lipitor         |         4 |
| Gabapentin      |         2 |
| Lisinopril      |        10 |
| Warfarin        |         2 |
+-----------------+-----------+
8 rows in set (0.00 sec)

#Count how much of each TYPE of medication has been purchased
mysql> select type as Type,sum(sales.quantity) as Purchased from sales,inventory,medicine where sales.inventory_num = inventory.inventory_num and inventory.ndc_num= medicine.ndc_num group by type;
+-----------------+-----------+
| Type            | Purchased |
+-----------------+-----------+
| Iron Deficiency |         7 |
| Thyroid         |         1 |
| Cholesterol     |         5 |
| Stomach         |         8 |
| Seizure         |         2 |
| Blood Pressure  |        10 |
| Blood Thinner   |         2 |
+-----------------+-----------+
7 rows in set (0.00 sec)

#Total Inventory
mysql> select sum(inventory.quantity) as TotalInventory from inventory;
+----------------+
| TotalInventory |
+----------------+
|            582 |
+----------------+
1 row in set (0.00 sec)

#All sales not by customer 1004
mysql> select inventory.inventory_num as Product,sales.customer_num as Customer from sales, inventory where inventory.inventory_num = sales.inventory_num and sales.customer_num in (select customer_num from customer where customer_num<> "1004");
+---------+----------+
| Product | Customer |
+---------+----------+
|    8036 |     1002 |
|    8720 |     1002 |
|    8677 |     1003 |
|    8292 |     1006 |
|    8292 |     1006 |
|    8384 |     1007 |
|    8291 |     1008 |
|    8713 |     1011 |
+---------+----------+
8 rows in set (0.00 sec)

#All workers with their position and manager
mysql> select worker.employee_name as Employee, worker.position as Position,manager.manager_name as Manager from worker cross join manager where worker.manager_num = manager.manager_num;
+----------+------------+---------+
| Employee | Position   | Manager |
+----------+------------+---------+
| Steve    | Manager    | Steve   |
| Sam      | Salesman   | Steve   |
| Pat      | Doctor     | Steve   |
| Sally    | Receiver   | Steve   |
| Helen    | Researcher | Steve   |
| Ashley   | Manager    | Ashley  |
| Danny    | Researcher | Ashley  |
| Harry    | Salesman   | Ashley  |
| Jenny    | Salesman   | Ashley  |
| Caroline | Doctor     | Ashley  |
| Sydney   | Receiver   | Ashley  |
+----------+------------+---------+
11 rows in set (0.00 sec)

mysql> notee;
