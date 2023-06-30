import pymysql

class Blog():
    def __init__(self):
        try:
            self.connection= pymysql.connect(
                host='localhost',
                user='root',
                passwd= 'fsfal4ever',
                db='mountainhikedef',
                charset='utf8mb4',
            )
            print("conexión exitosa")
            self.cursor= self.connection.cursor()
        except (pymysql.err.OperationalError, pymysql.err.InternalError) as e:
            print("Ocurrió un error al conectar: ", e)
#CREATE
    def InsertarNoticiaBlog(self):
        try:
            with self.connection.cursor() as cursor:
                sql="INSERT INTO blog (admin_id_admin, fecha, titulo, cuerpo) VALUES (%s,%s,%s, %s);"
                cursor.execute(sql, (1,'200 de Noviembre','Fuertes LLuvias se esperan para Diciembre', 'El servicio meteorológico prevee lluvias abundantes y poco comunes para esta época del año'))
                self.connection.commit()
                print("Se insertarón correctamente tus datos")
        finally:
            self.connection.close()
#READ
    def ConsultarBlog(self):
        try:
            with self.connection.cursor() as cursor:
                sql = "SELECT * FROM blog WHERE id_blog = %s;"
                cursor.execute(sql, int(input('Ingresa el id de la noticia del blog que querés consultar: ')))
                result=cursor.fetchall()
                print(result)
        finally:
            self.connection.close()
#UPDATE
    def ModificarBlog(self):
        try:
            with self.connection.cursor() as cursor:
                sql="UPDATE blog SET fecha=%s, titulo=%s, cuerpo=%s WHERE id_blog=%s;"
                cursor.execute(sql, ('11 de Noviembre', 'November rain', 'El servicio meteorológico anuncia una gran tormente para mediados de este mes',22))
                self.connection.commit()
                print("Se modificaron correctamente tus datos")
        finally:
            self.connection.close()
#DELETE
    def BorrarRegistroBlog(self):
        try:
            with self.connection.cursor() as cursor:
                sql= "DELETE FROM blog WHERE id_blog=%s;"
                cursor.execute(sql, int(input("ingresa el id del blog que deseas eliminar: ")))
                self.connection.commit()
                print("Se borraron correctamente tus datos")
        finally:
            self.connection.close()
            
blog=Blog()
blog.InsertarNoticiaBlog()
blog.ConsultarBlog()
blog.ModificarBlog()
blog.BorrarRegistroBlog()


        
