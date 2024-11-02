
'''
-- How to: https://cloud.google.com/blog/topics/developers-practitioners/how-connect-cloud-sql-using-python-easy-way
-- how to: https://cloud.google.com/sql/docs/mysql/samples/cloud-sql-mysql-sqlalchemy-connect-connector
--
-- ./google-cloud-sdk/bin/gcloud init
-- start again Y or N 
-- gcloud auth login 
-- copy link and login 
-- gcloud config set project PROJECT_ID
-- gcloud auth application-default login
--
--
'''


from google.cloud.sql.connector import Connector

import sqlalchemy
import pymysql
import os 
import json

custFileName = "keysData.json"
ROOT = os.path.dirname(os.getcwd()) + '/resource/' + custFileName

with open(ROOT, 'r') as file:
    jsonData = json.load(file)
    
    project_id = jsonData["GCP"]["project_id"]
    region = jsonData["GCP"]["region"]
    instance_name = jsonData["GCP"]["instance_name"]
    DB_USER = jsonData["GCP"]["DB_USER"]
    DB_PASS = jsonData["GCP"]["DB_PASS"]
    DB_NAME = jsonData["GCP"]["DB_NAME"]
    TABLE = jsonData["GCP"]["TABLE"]
    INSTANCE_CONNECTION_NAME = jsonData["GCP"]["INSTANCE_CONNECTION_NAME"]
    IP = jsonData["GCP"]["IP"]


print(" -- -- -- ")    
print("items:")

print(INSTANCE_CONNECTION_NAME)
print(DB_USER)
print(DB_PASS)
print(DB_NAME)
print(" -- -- -- ")

# initialize Connector object
connector = Connector()
print("connector ^ done ")


# function to return the database connection
def getconn() -> pymysql.connections.Connection:
    conn: pymysql.connections.Connection = connector.connect(
        INSTANCE_CONNECTION_NAME,
        "pymysql",
        user=DB_USER,
        password=DB_PASS,
        db=DB_NAME
    )
    return conn

# create connection pool
pool = sqlalchemy.create_engine(
    "mysql+pymysql://",
    creator=getconn,
)

# insert statement
# insert_stmt = sqlalchemy.text( "INSERT INTO my_table (id, title) VALUES (:id, :title)",)

with pool.connect() as db_conn:
    # insert into database
    # db_conn.execute(insert_stmt, parameters={"id": "book1", "title": "Book One"})

    # query database
    result = db_conn.execute(sqlalchemy.text(f"SELECT * from {TABLE}")).fetchall()

    # commit transaction (SQLAlchemy v2.X.X is commit as you go)
    # db_conn.commit()

    # Do something with the results
    for row in result:
        print(row)

print("done")

