#! /usr/bin/python
print('Content-type: text/html\n')
import random
import csv
import sys
def RandomSchool(filename):
    f = open("SAT-2010.csv","r")
    g = f.read()
    f.close()
    lines = g.split("\n")
    kabuk = lines[1:]
    istakoz = random.choice(kabuk)
    return istakoz

def TotalScore(istakoz):
    galata = istakoz.split(",")
    try:
        city = int(galata[3]) + int(galata[4]) + int(galata[5])
    except:
        city = "s"
    galata.append(city)
    return galata

c = RandomSchool("SAT-2010.csv")
d = TotalScore(c)
print('''<html>
    <head></head>
    <body><center><h3>Random School SAT Scores</h3>
    </center> <table border="1" align="center">
    <tbody><tr>
        <td>DBN</td>
        <td>School</td>
        <td>Number of tests</td>
        <td>Reading</td>
        <td>Math</td>
        <td>Writing</td>
        <td>Total</td>
    </tr>
    <tr> ''')
print('<td>'+str(d[0])+'+</td><td>'+str(d[1])+"</td><td>"+str(d[2])+'</td><td>'+str(d[3])+'</td><td>'
      +str(d[4])+'</td><td>'+str(d[5])+'</td><td>'+str(d[6])+'</td></tr>')
print('</tbody> </table> </body> </html>')





    
    

    


    