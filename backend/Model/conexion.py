import pymysql

try:
    connection= pymysql.connect(
        host='localhost',
        user='root',
        passwd= 'fsfal4ever',
        db='mountainhikedef', 
        charset='utf8mb4',
        cursorclass=pymysql.cursors.DictCursor
    )
    print("conexión exitosa")
except (pymysql.err.OperationalError, pymysql.err.InternalError) as e:
    print("Ocurrió un error al conectar: ", e)


