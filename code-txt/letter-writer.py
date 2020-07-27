#! /usr/bin/python
print ('Content-type: text/html\n')
def doit():
    import cgi, cgitb
    cgitb.enable()
    form=cgi.FieldStorage()
    Template='''<html>
    <body>Monday, 6th of August, 1668 C.E.<br>
     Dear ???prename??? ???name??? <br><br>
     
     It is with great pleasure that we have decided to
     send you this ???item??? as a small
     token of our esteem. <br>
     
     Unfortunately, returns are currently not possible. <br><br><br>
     Sincerely,<br>
     The Management<br>
     </body></html>
     '''

    if form.getvalue('date','') == 'ON':
        pass
    else:
        Template = Template.replace('Monday, 6th of August, 1668 C.E.','')
    prename=form.getvalue('like_rad',"")
    Template=Template.replace('???prename???',prename)
    name=form.getvalue('name','')
    Template=Template.replace('???name???',name)
    item=form.getvalue('troy','')
    Template=Template.replace('???item???',item)
    print(Template)
doit()

        
     
    