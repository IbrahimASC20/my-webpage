#! /usr/bin/python

print ('Content-type: text/html\n')

Template='''<html><body>
<center><table border="1">
Our recommendations are: <tr><td>#1 ???first??? with ???first2???
points,</td></tr>
<tr><td>#2 ???second??? with ???second2??? points, </td></tr>
<tr><td>#3 ???third??? with ???third2??? points. </td></tr></table>
<b> Have a good trip! <b>
</center>
</body></html>
'''
import cgi, cgitb
cgitb.enable()

def findem():
    
    form=cgi.FieldStorage()
    
    climate = {
        'Tur' : 8,
        'Ntr' : 6,
        'Grm' : 8,
        'Usa' : 8,
        'Jp' : 8,
        'Arg' : 9,
    }
    diversity = {
        'Tur' : 7,
        'Ntr' : 9,
        'Grm' : 9,
        'Usa' : 10,
        'Jp' : 5,
        'Arg' : 8,
    }
    business_friendly = {
        'Tur' : 8,
        'Ntr' : 8,
        'Grm' : 7,
        'Usa' : 9,
        'Jp' : 7,
        'Arg' : 8,   
    }
    education = {
        'Tur' : 6,
        'Ntr' : 10,
        'Grm' : 9,
        'Usa' : 9,
        'Jp' : 8,
        'Arg' : 7,
    }
    night_life = {
        'Tur' : 8,
        'Ntr' : 7,
        'Grm' : 8,
        'Usa' : 9,
        'Jp' : 8,
        'Arg' :9
    }
    food_culture = {
        'Tur' : 9,
        'Ntr' : 6,
        'Grm' : 7,
        'Usa' : 5,
        'Jp' : 8,
        'Arg' : 8,
    }
    freedom_of_press = {
        'Tur' : 3,
        'Ntr' : 10,
        'Grm' : 9,
        'Usa' : 7,
        'Jp' : 6,
        'Arg' : 6,
    }
    nature = {
        'Tur' : 10,
        'Ntr' : 7,
        'Grm' : 8,
        'Usa' : 10,
        'Jp' : 8,
        'Arg' : 8,
    }
    
    description=form.getvalue('soru','')
    if description=="":
        print("<h1> Error </h1>")
        print("Please fill in one of the checkboxes")
    else:
        x = description
        if x == "food/news":
            first=list(food_culture.keys())
            second=list(freedom_of_press.keys())
            third=list(business_friendly.keys())
            fourth=list(diversity.keys())
            
            donut = []
            a=0
            for i in range(6):
                a += float(food_culture[first[i]]) + float(freedom_of_press[second[i]]/2) + float(business_friendly[third[i]]/4) + float(diversity[fourth[i]]/2) 
                donut.append(a)
                a = 0
            
            k = {'Turkey' : donut[0],
                'Netherlands' : donut[1],
                'Germany' : donut[2],
                'Usa' : donut[3],
                'Japan' : donut[4],
                'Argentina' : donut[5],
                 }
        if x == "edu":
            first=list(education.keys())
            second=list(freedom_of_press.keys())
            third=list(diversity.keys())
            
            donut = []
            a=0
            for i in range(6):
                a += float(education[first[i]]) + float(freedom_of_press[second[i]]/2) + float(diversity[third[i]]) 
                donut.append(a)
                a = 0
            
            k = {'Turkey' : donut[0],
                'Netherlands' : donut[1],
                'Germany' : donut[2],
                'Usa' : donut[3],
                'Japan' : donut[4],
                'Argentina' : donut[5],
                 }
        if x == "business":
            first=list(food_culture.keys())
            second=list(freedom_of_press.keys())
            third=list(business_friendly.keys())
            fourth=list(diversity.keys())
            
            donut = []
            a=0
            for i in range(6):
                a += float(food_culture[first[i]]/3) + float(freedom_of_press[second[i]]/2) + float(business_friendly[third[i]]) + float(diversity[fourth[i]]/2) 
                donut.append(a)
                a = 0
            
            k = {'Turkey' : donut[0],
                'Netherlands' : donut[1],
                'Germany' : donut[2],
                'Usa' : donut[3],
                'Japan' : donut[4],
                'Argentina' : donut[5],
                 }
        if x == "fun":
            first=list(food_culture.keys())
            second=list(night_life.keys())
            third=list(nature.keys())
            fourth=list(diversity.keys())
            
            donut = []
            a=0
            for i in range(6):
                a += float(food_culture[first[i]]) + float(night_life[second[i]]) + float(nature[third[i]]/3) + float(diversity[fourth[i]]/2) 
                donut.append(a)
                a = 0
            
            k = {'Turkey' : donut[0],
                'Netherlands' : donut[1],
                'Germany' : donut[2],
                'Usa' : donut[3],
                'Japan' : donut[4],
                'Argentina' : donut[5],
                 }
        if x == "unique":
            first=list(climate.keys())
            second=list(nature.keys())
            third=list(diversity.keys())
            
            donut = []
            a=0
            for i in range(6):
                a += float(climate[first[i]]) + float(nature[second[i]]/2) +  float(diversity[third[i]]/2) 
                donut.append(a)
                a = 0
            
            k = {'Turkey' : donut[0],
                'Netherlands' : donut[1],
                'Germany' : donut[2],
                'Usa' : donut[3],
                'Japan' : donut[4],
                'Argentina' : donut[5],
                 }
            
        sasha = []
        for i in list(k.keys()):
            sasha.append(k[i])
                
        sasha.sort()
        george = []
        for i in list(k.keys()):
            if k[i] == sasha[5]:
                george.append(i)
        for i in list(k.keys()):
            if k[i] == sasha[4]:
                george.append(i)
        for i in list(k.keys()):
            if k[i] == sasha[3]:
                george.append(i)
        HTML=Template
        HTML = HTML.replace('???first???',george[0])
        HTML = HTML.replace('???first2???',str(sasha[5]))
        HTML = HTML.replace('???second???',george[1])
        HTML = HTML.replace('???second2???',str(sasha[4]))
        HTML = HTML.replace('???third???',george[2])
        HTML = HTML.replace('???third2???',str(sasha[3]))
            
        print(HTML)
findem()
