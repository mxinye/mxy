import json
import pymysql

mysql = pymysql.connect(host='localhost',user='root',passwd='123',db='clothes')
cur = mysql.cursor()


with open('aaa.json','r') as f:
    test = f.read()
    data = json.loads(test)





sqla = '''
    insert into woman(name,img,price)VALUES(%s,%s,%s)
'''


for i in data:
    for a in i:
        cur.execute(sqla, (a['shop'],a['img'], a['price']))


mysql.commit()
cur.close()
mysql.close()
print('success')