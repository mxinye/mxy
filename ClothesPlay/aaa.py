import json
import pymysql

mysql = pymysql.connect(host='localhost',user='root',passwd='123',db='clothes')
cur = mysql.cursor()


with open('aaa.json','r') as f:
    test = f.read()
    data = json.loads(test)

with open('aaa1.json','r') as f:
    test1 = f.read()
    data1 = json.loads(test)

with open('aaa2.json','r') as f:
    test2 = f.read()
    data2 = json.loads(test)



sqla = '''
    insert into woman(name,img,price)VALUES(%s,%s,%s)
'''
sqla1 = '''
    insert into man(name,img,price)VALUES(%s,%s,%s)
'''
sqla2 = '''
    insert into child(name,img,price)VALUES(%s,%s,%s)
'''
for i in data:
    for a in i:
        cur.execute(sqla, (a['shop'],a['img'], a['price']))
for i1 in data1:
    for a1 in i1:
        cur.execute(sqla1, (a1['shop'],a1['img'], a1['price']))
for i2 in data2:
    for a2 in i2:
        cur.execute(sqla2, (a2['shop'],a2['img'], a2['price']))

mysql.commit()
cur.close()
mysql.close()
print('success')