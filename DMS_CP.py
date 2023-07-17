from tabulate import tabulate
from datetime import *
import mysql.connector

con = mysql.connector.connect(host = "localhost" , password = "gyanvi", user = "root", database = "rms")
if con.is_connected(): 
    cro = con.cursor()

    close=0
    while(close!=1):
        print(" 1. Regitration of new customer\n","2. Menu display\n","3. Customer reservation \n","4. Order by customer\n", "5. Generate Bill\n" , "6. Close portal \n")
        ch = int( input(" Enter your choice from above: "))
        print()
        if ch == 2:
            q1  = "SELECT* FROM  menu"
            cro.execute(q1)
            result = cro.fetchall()
            print (tabulate(result, headers=["id" , "name" ,"code" ,"image" ,"price" ,"description"]))
            print()
        
            
        elif ch == 1:
            nm = input("Enter your name: ")
            em =  input("Enter your email: ")
            pswd = int(input("Enter your password: "))
            ad = input("Enter your address: ")
            ph = int(input("Enter your phone no.: "))
            q2 = "INSERT INTO customer (name,email,password,address,phone) VALUES('{}','{}','{}','{}','{}')".format(nm,em,pswd,ad,ph)
            cro.execute(q2)
            con.commit()
            print("User registered successfully !!")
            print()
        
        
        elif ch==3:
            nm=input("Enter your name: ")
            em=input("Enter your email: ")
            ppl=int(input("Enter no. of people to visit: "))
            dt=datetime.now().strftime('%Y-%m-%d')
            timee=datetime.now().strftime('%H:%M:%S')
            q3="INSERT INTO reservation (name, res_date, email, res_time, no_of_ppl) VALUES('{}','{}','{}','{}','{}');".format(nm,dt,em,timee,ppl)
            #"insert into reservation (name, res_date, email, res_time, no_of_ppl) values ({}, {}, {}, {}, {})".format(nm,dt,em,timee,ppl)
            cro.execute(q3)
            con.commit()
            print("Reserved successfully !!")
            print()

        elif ch==4:
            
            em=input("Enter your email: ")
            def order(em):
                email=em
                ordt=datetime.now().strftime('%Y-%m-%d')
                cd=input("Enter code of dish: ")
                qnt=int(input("Enter quantity of dish: "))
                ordtime=datetime.now().strftime('%H:%M:%S')
                q1  = "SELECT* FROM  menu"
                cro.execute(q1)
                result = cro.fetchall()
                for i in result:
                    if i[2]==cd:
                        tot=i[4]*qnt
                q4="INSERT INTO orders (email,ord_date,code, quantity, ord_time, total) VALUES('{}','{}','{}','{}','{}','{}');".format(em,ordt,cd,qnt,ordtime,tot)
                cro.execute(q4)
                con.commit()
                more=input("More to order ? (y/n) ")
                if more=="y":
                    order(email)
                else:
                    print("Order placed successfully !!")
                    print()
            order(em)
            

        elif ch==5:
            tot=0
            em=input("Enter your email: ")
            ordt=datetime.now().strftime('%Y-%m-%d ')
            q5  = "SELECT* FROM  orders where email='{}' and ord_date='{}'".format(em,ordt)
            cro.execute(q5)
            result = cro.fetchall()
            for i in result:
                tot+=i[6]
            print (tabulate(result, headers=["id" , "email" ,"ord_date" ,"code" ,"qauntity" ,"ord_time","cost"]))
            print()
            print("Total Amount= ",tot)
            print()
            print("Thank you for visiting :)")
            print()
        

        elif ch==6:
            close=1
            con.close()
else:
    print("Unable to connect to database !!")

    
        





        
