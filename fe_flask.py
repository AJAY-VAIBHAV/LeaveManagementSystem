from flask import Flask, render_template, request, redirect, url_for
from flask_cors import CORS as cors
import sqlite3 as sql
import sys
import postgres_dbms as db
from json import dumps

app = Flask(__name__)
cors(app)


@app.route('/')
def home():
   return render_template('home.html')


@app.route('/login')
def login():
   return render_template('login.html')


@app.route('/validate', methods=["POST", "GET"])
def validate():
   username = dict(request.form)['uname']
   password = dict(request.form)['pswd']
   print(request.form)
   try:
      if int(username) >= 2000:  # Manager
         if(db.verifyManager(username, password, db.c)):
            return redirect('/manager/{}'.format(username),code = 307)
         else:
            return render_template('print_error.html', inputtext="Incorrect username or password!")
      else:  # Employee
         if(db.verifyEmployee(username, password, db.c)):
            return redirect('/employee/{}'.format(username),code = 307)
         else:
            return render_template('print_error.html',inputtext="Incorrect username or password!")
   except Exception as e:
      return render_template('print_error.html',inputtext="Invalid ID! ("+str(e)+" )")

@app.route('/leaveapplied/<username>', methods=["POST", "GET"])
def leaveapplied(username):
   startDate = dict(request.form)['stdate']
   endDate = dict(request.form)['endate']
   Ltype = dict(request.form)['lvtype']
   Reason = dict(request.form)['reason']
   try:
      db.applyleave(username,startDate,endDate,Ltype,Reason,db.c)
      return redirect('/employee/{}'.format(username,code = 307))
   except Exception as e:
      return render_template('print_error.html',inputtext="Problem with Database! ("+str(e)+" )")

@app.route('/employee/<username>',methods = ["POST","GET"])
def loademployee(username):
   # if(request.method=="GET"):
   #    return render_template('print_error.html',inputtext="You Hacker? try better ;)")
   log = db.viewLog(username, db.c)
   return render_template('employee_home.html',username=username,log=log)

@app.route('/manager/<username>',methods = ["POST","GET"])
def loadmanager(username):
   # if(request.method=="GET"):
   #    return render_template('print_error.html',inputtext="You Hacker? try better ;)")
   lvpend = db.viewPending(username,db.c)
   return render_template('manager_home.html',username=username,lvpend=lvpend)

@app.route('/leave/<username>/<status>',methods =["POST"])
def leaveDecide(username,status):
   try:
      leave_id = (int(str(request.data).split('"')[1]))
      db.manageLeave(leave_id,status,db.c)
      return redirect('/manager/{}'.format(username,code = 307))
   except Exception as e:  
      return render_template('print_error.html',inputtext="Problem with Database! ("+str(e)+" )")


app.run(host = '0.0.0.0', port = 4000, debug = 1)
