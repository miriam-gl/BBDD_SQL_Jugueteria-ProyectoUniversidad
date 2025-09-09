# BBDD_SQL_Jugueteria-ProyectoUniversidad
Modelo, creación y consultas de una base de datos en PostgreSQL de una juguetería ficticia con datos de los clientes, empleados, proveedores, juguetes, envíos y detalles de compras con clientes y proveedores.

* Requisitos previos: 

Asegúrate de tener instalado [PostgreSQL](https://www.postgresql.org/download/) y un medio para ejecutar consultas como [pgAdmin](https://www.pgadmin.org/download/) o psql desde la terminal.

* Flujo de uso:
  
Antes de trabajar con la base de datos, consulta los diagramas para entender la estructura:

1. Puedes consultar el modelo entidad relación en [modelo_ER_jugueteria.pdf](https://github.com/miriam-gl/BBDD_SQL_Jugueteria-ProyectoUniversidad/blob/main/modelo-entidad-relaci%C3%B3n/modelo_ER_jugueteria.pdf), mientras que sus detalles los puedes ver en [Modelo_ER_detalles.pdf](https://github.com/miriam-gl/BBDD_SQL_Jugueteria-ProyectoUniversidad/blob/main/modelo-entidad-relaci%C3%B3n/Modelo_ER_detalles.pdf) 
2. Puedes consultar el diagrama de clases en [Modelo_DC_jugueteria.pdf](https://github.com/miriam-gl/BBDD_SQL_Jugueteria-ProyectoUniversidad/blob/main/Diagrama-de-clases/Modelo_DC_jugueteria.pdf).

Para la creación de la base de datos, ejecutamos los siguientes scripts en ese orden:
3. Creamos la base de datos con el script [creación_BBDD_jugueteria.sql](https://github.com/miriam-gl/BBDD_SQL_Jugueteria-ProyectoUniversidad/blob/main/BBDD_setup/creaci%C3%B3n_BBDD_jugueteria.sql), en el se crean las tablas de acuerdo a las clases de nuestro modelo orientado a objetos.
4. Se realiza el proceso de integridad para la base de datos, este consiste en agregar una llave primaria a cada una de las tablas construidas (integridad identidad), agregar las llaves foráneas correspondientes (integridad referencial), agregar los comandos CHECK correspondientes, que delimitan el dominio de algunos atributos (integridad de dominio) y determinar qué atributos no deben tener valores nulos (Integridad de no nulidad), con el script [integridad_BBDD_jugueteria.sql](https://github.com/miriam-gl/BBDD_SQL_Jugueteria-ProyectoUniversidad/blob/main/BBDD_setup/integridad_BBDD_jugueteria.sql)
