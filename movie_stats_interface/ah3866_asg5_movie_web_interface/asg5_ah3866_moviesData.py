#!/usr/bin/python3 

import sys
import codecs
sys.stdout = codecs.getwriter("utf-8")(sys.stdout.detach())

import cgi
import sqlite3
import cgitb
cgitb.enable() 

print ("Content-Type: text/html\r\n\r\n")
print ( "<html>\n<head>")
print ( "<title>movie data selection</title>")
print ( '''<link href="../custom.css" rel="stylesheet" type="text/css" />''')
print ( '''<link href="asg5_ah3866_moviesData.css" rel="stylesheet" type="text/css" />''')
print(" </head>")
print ( "<body>")

form = cgi.FieldStorage()
title = "Movie Data Search Results"




user_genre = form["genre"].value
user_limit = form["limit"].value
user_order = form["order"].value



print ( "<h4>"+title+"<br>\n </h4>")




conn = sqlite3.connect('movies.db')
c = conn.cursor()

if user_genre != "All":
    query = 'SELECT title,genres,imdb_score FROM movies WHERE genres ="'+user_genre +'" ORDER BY imdb_score'
    if user_order == "High to Low IMDB rating":
        query += ' DESC '
    elif user_order == "Low to High IMDB rating":
        query += ' ASC '
    query += 'LIMIT '+str(user_limit)
else:
    query = 'SELECT title,genres,imdb_score FROM movies WHERE (genres = "Sci-Fi" OR genres = "Comedy" OR genres = "Horror" OR genres = "Romance") ORDER BY imdb_score'
    if user_order == "High to Low IMDB rating":
        query += ' DESC '
    elif user_order == "Low to High IMDB rating":
        query += ' ASC '
    query += 'LIMIT '+str(user_limit)

print("<p><em>Query:  </em>"+query+"</p>")
if user_genre == "All":
    print("<p><em>You picked all genres </em></p>")
else:
    print("<p><em>The genre you picked: </em>" +user_genre+"</p>")

if user_limit == '1':
    print("<p><em>You wanted </em> 1 record </p>")
elif user_limit == '2' or user_limit == '3' or user_limit == '4' or user_limit == '5':
    print("<p><em>You wanted </em>"+str(user_limit)+" records </p>")
    
print("<p><em>You wanted to show records from "+user_order+"</p>")

c.execute(query)

print ("<table >")

# first print a headings row
print ("<tr id='start'>")
print ("<td class='header'>T i t l e</td>")
print ("<td class='header'>G e n r e</td>")
print ("<td class='header'>I M D B </br> S c o r e</td>")
print ("</tr>")

# now print the data
for title,genres,imdb_score in c:
    print ("<tr >")
    print ("<td>"+title        +"</td>")
    print ("<td>"+genres       +"</td>")
    print ("<td>"+str(imdb_score)      +"</td>")
    print ("</tr>")

print ("</table>")

# close the cursor
c.close()

print("</body>")
print("</html>")




