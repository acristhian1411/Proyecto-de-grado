require "application_system_test_case"

class ProductosTest < ApplicationSystemTestCase
  setup do
    @producto = productos(:one)
  end

  test "visiting the index" do
    visit productos_url
    assert_selector "h1", text: "Productos"
  end

  test "creating a Producto" do
    visit productos_url
    click_on "New Producto"

    fill_in "Iva", with: @producto.iva
    fill_in "Marca", with: @producto.marca_id
    fill_in "Prod Active", with: @producto.prod_active
    fill_in "Prod Descrip", with: @producto.prod_descrip
    fill_in "Proveedore", with: @producto.proveedore_id
    fill_in "Sub Category", with: @producto.sub_category_id
    click_on "Create Producto"

    assert_text "Producto was successfully created"
    click_on "Back"
  end

  test "updating a Producto" do
    visit productos_url
    click_on "Edit", match: :first

    fill_in "Iva", with: @producto.iva
    fill_in "Marca", with: @producto.marca_id
    fill_in "Prod Active", with: @producto.prod_active
    fill_in "Prod Descrip", with: @producto.prod_descrip
    fill_in "Proveedore", with: @producto.proveedore_id
    fill_in "Sub Category", with: @producto.sub_category_id
    click_on "Update Producto"

    assert_text "Producto was successfully updated"
    click_on "Back"
  end

  test "destroying a Producto" do
    visit productos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Producto was successfully destroyed"
  end
end
