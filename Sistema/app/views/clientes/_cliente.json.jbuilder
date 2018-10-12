json.extract! cliente, :id, :nombre, :apellido, :n_cedula, :cli_telefono, :limite_credito, :cli_activo, :ciudades_id, :barrio_id, :created_at, :updated_at
json.url cliente_url(cliente, format: :json)
