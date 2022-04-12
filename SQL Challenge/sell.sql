CREATE TABLE sell (
   id BIGSERIAL NOT null PRIMARY KEY,
   -- Creo una referencia a la tabla de clientes
   client_id BIGINT NOT NULL REFERENCES client (id),
   -- Se crea una referencia a la tabla Proucto
   product_id BIGINT NOT NULL REFERENCES product (id),
   -- Cantidad de prdocuto requerido
   quantity BIGINT NOT NULL 
);
