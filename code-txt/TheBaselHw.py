import math
import os
import sys
def baselsum(num):
    my_list= []
    my_list= list(range(num+1))
    if num==0:
        return 0
    if num<0:
        return False
    ans=0
    for i in my_list[1:]:
        ans += float(1.0/i**2)
    val= float(math.pi**2/6)
    finna= val-ans
    return [num, ans, val, finna]
f = open(sys.argv[1], "w")
f.write('''<html> <body> <center>
<b><h3>The Basel Calculations</h3></b>
<table border="1">
<tr><td>N</td> <td>Sum</td> <td>pi*pi/6</td>
<td>Difference</td></tr>''')
for m in range(2,len(sys.argv)):
    if sys.argv[m].isdigit() == True:
        sa = list(baselsum(int(sys.argv[m])))
        f.write('<tr><td>'+str(sa[0])+'</td><td>'+str(sa[1])+"</td><td>"+str(sa[2])+'</td><td>'+str(sa[3])+'</td></tr>')
    else:
        print('Wrong Data Type')
        break
f.write('</table> </center> </body> </html>')
f.close()


    

    



        
    
    
    
    
    
    
    
