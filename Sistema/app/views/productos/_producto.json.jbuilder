json.extract! producto, :id, :prod_descrip, :iva, :prod_active, :proveedore_id, :marca_id, :sub_category_id, :created_at, :updated_at
json.url producto_url(producto, format: :json)
