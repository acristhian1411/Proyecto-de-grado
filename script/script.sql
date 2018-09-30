
 /*
	Script para poner valores por defecto
 */
ALTER TABLE public.categories
   ALTER COLUMN category_active SET DEFAULT true;
ALTER TABLE public.marcas
   ALTER COLUMN marca_active SET DEFAULT true;
ALTER TABLE public.productos
   ALTER COLUMN prod_active SET DEFAULT true;
ALTER TABLE public.proveedores
   ALTER COLUMN prov_activo SET DEFAULT true;
ALTER TABLE public.sub_categories
   ALTER COLUMN sub_categ_active SET DEFAULT true;
ALTER TABLE public.sucursales
   ALTER COLUMN suc_activo SET DEFAULT true;


 /*
	Funcion para insertar productos en tabla stock
 */
CREATE FUNCTION public.tr_produc_sucursal() RETURNS trigger AS
$BODY$
BEGIN
IF TG_OP = 'INSERT' THEN
		INSERT INTO stocks (producto_id, sucursale_id, stock, created_at, updated_at) 
		VALUES (NEW.id, 1, 0, NOW(), NOW());
		INSERT INTO stocks (producto_id, sucursale_id, stock, created_at, updated_at) 
		VALUES (NEW.id, 2, 0, NOW(), NOW());
		INSERT INTO stocks (producto_id, sucursale_id, stock, created_at, updated_at) 
		VALUES (NEW.id, 3, 0, NOW(), NOW());
END IF;
return NEW;    

END;$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;
ALTER FUNCTION public.tr_produc_sucursal()
  OWNER TO usuario;


 /*
	Trigger asignado a tabla productos
 */
CREATE TRIGGER tg_prod_sucursal AFTER INSERT
   ON public.productos FOR EACH ROW
   EXECUTE PROCEDURE public.tr_produc_sucursal();
