import psycopg2
import sys
from prettytable import PrettyTable
import datetime

def emp_login():
	if not(emp_id.isdigit()):
		print("Wrong Employee ID")
		closedb()
	
	q = "select password from employee where emp_id = "+emp_id+";"
	cursor.execute(q)
	result = cursor.fetchone()

	if result is None:
		print("\nWrong Employee ID")
		closedb()
	if result[0] == pass_word:
		print("\nSuccessful Login\n")
	else:
		print("\nWrong password")
		closedb()

def man_login():
	if not(man_id.isdigit()):
		print("\nWrong Employee ID")
		closedb()
	
	q = "select man_password from manager where man_id = "+man_id+";"
	cursor.execute(q)
	result = cursor.fetchone()

	if result is None:
		print("\nWrong Manager ID")
		closedb()
	if result[0] == pass_word:
		print("\nSuccessful Login\n")
	else:
		print("\nWrong password")
		closedb()
	X = PrettyTable()
	Y = PrettyTable()
	q="select * from leave_log where leave_id in(select leave_id from emp_leave where emp_id in (select emp_id from employee where dept_id=(select dept_id from department where man_id="+man_id+"))) and status='Pending';"
	cursor.execute(q)
	result = cursor.fetchall()
	q = "SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'leave_log' ORDER BY ORDINAL_POSITION"
	cursor.execute(q)
	col_names = cursor.fetchall()
	for i in range(len(col_names)):
		col_names[i] = ''.join(col_names[i])
	X.field_names = col_names
	for i in range(len(col_names)):
		col_names[i] = ''.join(col_names[i])
	X.field_names = col_names
	for i in result:
		X.add_row(i)

	print(X)
	if len(result)==0:
		print("No requests available")
	else:
		result1 = int(input("Choose the required leave id "))
		q = "select emp_id from emp_leave where leave_id = "+str(result1)+';'
		cursor.execute(q)
		a = cursor.fetchone()
		q = "select * from employee where emp_id = "+str(a[0])+';'
		cursor.execute(q)
		result = cursor.fetchall()
		q = "SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'employee' ORDER BY ORDINAL_POSITION"
		cursor.execute(q)
		col_names = cursor.fetchall()
		for i in range(len(col_names)):
			col_names[i] = ''.join(col_names[i])
		Y.field_names = col_names
		for i in result:
			Y.add_row(i)

		print(Y)

		b = input("\nDo you want to approve or disapprove (Yes/No)")
		if b=='Yes':
			q = "update leave_log set status='Approved' where leave_id = "+str(result1)+";"
			#print (q)
			cursor.execute(q)
			connection.commit()
			print("Successfully updated")
		else:
			q = "update leave_log set status='Not Approved' where leave_id = "+str(result1)+';'
			cursor.execute(q)
			#print("Successfully updated")
		closedb()

		
def logout():
	print("\nLogged out.  Exiting!")
	closedb()

def viewlog():
	X = PrettyTable()
	q = "select * from leave_log where leave_id in (select leave_id from emp_leave where emp_id = '"+emp_id+"');"
	cursor.execute(q)
	result = cursor.fetchall()

	if result is None:
		print("\nLoggedNo records found!")
		closedb()

	q = "SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'leave_log' ORDER BY ORDINAL_POSITION"
	cursor.execute(q)
	col_names = cursor.fetchall()
	for i in range(len(col_names)):
		col_names[i] = ''.join(col_names[i])
	X.field_names = col_names
	for i in result:
		X.add_row(i)

	print(X)

def genlid():
	q = "select max(leave_id) from leave_log;"
	cursor.execute(q)
	return (cursor.fetchone()[0]+1)

def applyleave():
	leave_id = genlid()
	print("Start Date (DD-MM-YYYY):",end = ' ')
	start_date = input()
	print("End Date (DD-MM-YYYY):",end = ' ')
	end_date = input()
	print("Type (PL/SL/CL):",end = ' ')
	l_type = input()
	print("Reason:",end = ' ')
	reason = input()
	today = datetime.date.today()
	d1 = today.strftime("%d/%m/%Y")
	apply_date = datetime.datetime.strptime(d1,"%d/%m/%Y").strftime("%Y-%m-%d")
	status  = "Pending"
	q = "insert into leave_log values("+str(leave_id)+",'"+start_date+"','"+end_date+"','"+reason+"','"+l_type+"','"+status+"','"+apply_date+"',NULL);"
	cursor.execute(q)
	q = "insert into emp_leave values("+str(emp_id)+","+str(leave_id)+");"
	cursor.execute(q)
	print("Successful Applied")

#Closing database connection
def closedb():
	if(connection):
	    cursor.close()
	    connection.close()
	print("\nPostgreSQL connection is closed")
	sys.exit()

#Connection variables Declaration
connection = psycopg2.connect(user = "postgres",password = "postgre123",
							host = "127.0.0.1",port = "5432",database = "postgres")
cursor = connection.cursor()


a = int(input("1.Manager\n2.Employee\n"))
if a==2:
	print("Employee ID:",end = " ")
	emp_id = input()
	print("Password:",end = " ")
	pass_word = input()
	emp_login()

	#Successful Login
	while(True):
		print("1.Apply Leave\n2.View Log\n3.Logout")
		choice = int(input())
		if choice == 1:
			applyleave()
		elif choice == 2:
			viewlog()
		elif choice == 3:
			logout()
		else:
			print("\nWrong Choice!")
			closedb()
		connection.commit()
else:
	print("Manager ID:",end = " ")
	man_id = input()
	print("Password:",end = " ")
	pass_word = input()
	man_login()


