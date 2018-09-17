require 'test_helper'

class ProductosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @producto = productos(:one)
  end

  test "should get index" do
    get productos_url
    assert_response :success
  end

  test "should get new" do
    get new_producto_url
    assert_response :success
  end

  test "should create producto" do
    assert_difference('Producto.count') do
      post productos_url, params: { producto: { iva: @producto.iva, marca_id: @producto.marca_id, prod_active: @producto.prod_active, prod_descrip: @producto.prod_descrip, proveedore_id: @producto.proveedore_id, sub_category_id: @producto.sub_category_id } }
    end

    assert_redirected_to producto_url(Producto.last)
  end

  test "should show producto" do
    get producto_url(@producto)
    assert_response :success
  end

  test "should get edit" do
    get edit_producto_url(@producto)
    assert_response :success
  end

  test "should update producto" do
    patch producto_url(@producto), params: { producto: { iva: @producto.iva, marca_id: @producto.marca_id, prod_active: @producto.prod_active, prod_descrip: @producto.prod_descrip, proveedore_id: @producto.proveedore_id, sub_category_id: @producto.sub_category_id } }
    assert_redirected_to producto_url(@producto)
  end

  test "should destroy producto" do
    assert_difference('Producto.count', -1) do
      delete producto_url(@producto)
    end

    assert_redirected_to productos_url
  end
end
