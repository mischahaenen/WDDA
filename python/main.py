from multiprocessing import connection
import sqlite3
from prettytable import from_db_cursor
import pandas

connection = sqlite3.connect('example.db')
cursor = connection.cursor()
cursor.execute('DROP TABLE IF EXISTS Mitarbeiter')
cursor.execute('''
               CREATE TABLE Mitarbeiter (
                   id INTEGER PRIMARY KEY,
                   name TEXT NOT NULL,
                   alt INTEGER NOT NULL,
                   adresse VARCHAR(30) NOT NULL,
                   lohn REAL,
                   verheiratet BOOLEAN,
                   departement TEXT
               );
               ''')
cursor.execute(
    "INSERT INTO Mitarbeiter VALUES(1, 'Anja', 27, 'Zürich', 10000, 'ja', 'kunst')")
cursor.execute(
    "INSERT INTO Mitarbeiter VALUES(2, 'Urs', 27, 'Zürich', 10000, 'nein', 'haba')")
cursor.execute(
    "INSERT INTO Mitarbeiter VALUES(3, 'Anna', 27, 'Zürich', 10000, 'ja', 'IT')")
cursor.execute(
    "INSERT INTO Mitarbeiter VALUES(4, 'Ivan', 27, 'Zürich', 10000, 'ja', 'kunst')")
connection.commit()
cursor.execute("DELETE FROM Mitarbeiter WHERE name = 'Ivan'")
connection.commit()
cursor.execute('SELECT * FROM Mitarbeiter')
print(from_db_cursor(cursor))

df = pandas.read_csv('vgsales.csv')
df.to_sql('Game_Sale', con=connection, if_exists='replace', index=False)
cursor.execute("SELECT Global_Sales FROM Game_Sale WHERE name = 'Minecraft'")
print(from_db_cursor(cursor))
