-- CREATE DATABASE sql_challenge   -- se creo una base de datos con las siguientes tablas.
--\c sql_challenge                 -- Accedemos a la Base de Datos.
--\i products.sql                  -- Creamos la tabla products apartir de un archivo "".sql".
--\i users.sql                     -- Creamos la tabla users.
--\i sell.sql                      -- Creamos la tabla sell que tiene el registro de ventas

\set product_id 32
\set product_quantity 10
\set client_id 31
-- Consulta para verificar el stock disponible --Actulizamos a los valores de stock convirtiendo a Int
SELECT * FROM product WHERE id = :product_id AND CAST(stock AS Integer) > 0 ;

-- Consulta para verificar si se puede vender el producto
SELECT * FROM product WHERE id = :product_id AND  available_for_selling = 'true' ;

-- Actualizando la tabla de "producto" en la columna de "stock" para restar la cantidad solicitada por client.
UPDATE product SET stock = CAST(stock AS Integer) - :product_quantity WHERE id = :product_id;  

-- Registrando la venta en la tabla "sell".
INSERT INTO sell (client_id, product_id, quantity) VALUES (:client_id, :product_id, :product_quantity)