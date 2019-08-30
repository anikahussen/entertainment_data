#!/usr/bin/python3 



import cgi
import sqlite3
import cgitb
cgitb.enable() 

form = cgi.FieldStorage()
user_genre = form["genre"].value
user_limit  = form["limit"].value
user_order = form["order"].value

# set up and open an HTML page
print("Content-Type: text/html\r\n\r\n")
print('''
<!DOCTYPE html>
<html>

<head>
    <title>Workshop - Movie IMDB Ratings - Spring 2019 - OUTPUT</title>
    <link rel="stylesheet" type="text/css" href="asg5_ah3866_moviesData.css">
</head>

<body>
    <h3>Movie IMDB Ratings</h3>
    <h4>OUTPUT</h4>
''')
print("<p>Genre selected: "+user_genre+"</p>")
print("<p>Number of rows: "+user_limit+"</p>" )
print("<hr />")

# 4. write the query

if author_name == "All":
    query = '''SELECT title,genres,imdb_score,year_written
               FROM movies
               ORDER BY imdb_score '''
    if user_order == "High to Low IMDB rating":
        query+= 'DESC'
    elif user_order == "Low to High IMDB rating":
        query+= 'ASC'

    query += '''
               LIMIT  '''
    query += user_limit

else:
    query = '''SELECT title, genres, imdb_score
                   FROM movie
                   WHERE genres = "'''
    query += user_genre
    query+='''"
                   ORDER BY imdb_score  '''
    if user_order == "High to Low IMDB rating":
        query+= 'DESC'
    elif user_order == "Low to High IMDB rating":
        query+= 'ASC'

    query += '''
                   LIMIT  '''
    query += user_limit
print("<p><em>QUERY: </em>"+query+"</p>")           

# 5. connect the database
conn = sqlite3.connect('movies.db')
c = conn.cursor()

#6. run the query
c.execute(query)

#7. get and display the output 
print("<table>")
print("<tr>")
print("<th>School district name</th>")
print("<th>Population</th>")
print("</tr>")
for title, genres, imdb_score in c:
    print("<tr>")
    print("\t<td>"+title+"</td>")
    print("\t<td>"+genres+"</td>")
    print("\t<td>"+imdb_score+"</td>")
    print("</tr>")
print("</table>")

# close up the database
c.close()

# close the HTML page
print("</body>\n</html>")







