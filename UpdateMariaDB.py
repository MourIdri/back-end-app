import json
import ast
import sys
import os 
from os.path import join, dirname
from os import environ
from mysql.connector import MySQLConnection, Error
from mysql.connector import MySQLConnection, Error
from python_mysql_dbconfig import read_db_config

IDObject= sys.argv[1] 
CurrentMail= sys.argv[2]
FirstName= sys.argv[3]  
LastName= sys.argv[4]
CurrentCompany= sys.argv[5]
STRUserUUID1= sys.argv[6]
JobRole= sys.argv[7]
# this is a trick while waiting for user increment
IDObject="1"



def insert_web_information_fct(web_information_update):
    row1="title"
    row2="isbn"
    query1 = "CREATE TABLE IF NOT EXISTS `web_information` (`IDObject` int(11) NOT NULL ,`CurrentMail` varchar(300) NOT NULL,`FirstName` varchar(300) NOT NULL,`LastName` varchar(300) NOT NULL,`CurrentCompany` varchar(600) NOT NULL, `STRUserUUID1` varchar(300) NOT NULL,`JobRole` varchar(300) NOT NULL);"
    #query2 = "INSERT INTO web_information(IDObject,CurrentMail,FirstName,LastName,CurrentCompany,STRUserUUID1,JobRole) " \
    #        "VALUES(%s,%s,%s,%s,%s,%s,%s)"
    query2 = "INSERT INTO web_information(IDObject,CurrentMail,FirstName,LastName,CurrentCompany,STRUserUUID1,JobRole) " \
            "VALUES(%s,%s,%s,%s,%s,%s,%s)"
    try:
        print "*********************************DEBUG A **********************"
        db_config = read_db_config()
        print "*********************************DEBUG A-1 **********************"        
        conn = MySQLConnection(**db_config)
        print "*********************************DEBUG A-2 **********************"        
        cursor = conn.cursor()
        print "*********************************DEBUG A-3 **********************"        
        cursor.execute(query1)
        print "*********************************DEBUG A-4 **********************"        
        cursor.executemany(query2, web_information_update)
        print "*********************************DEBUG A-5 **********************"        
        conn.commit()
        print "*********************************DEBUG A-6 **********************"        
    except Error as e:
        print "*********************************DEBUG B **********************"        
        print('Error:', e)
    finally:
        print "*********************************DEBUG C **********************"        
        cursor.close()
        conn.close()

#web_information_update=[(IDObject,CurrentMail,FirstName,LastName,CurrentCompany,STRUserUUID1,JobRole)]
web_information_update=[(IDObject, CurrentMail,FirstName,LastName,CurrentCompany,STRUserUUID1,JobRole)]
insert_web_information_fct(web_information_update)
