require "application_system_test_case"

class ProveedoresTest < ApplicationSystemTestCase
  setup do
    @proveedore = proveedores(:one)
  end

  test "visiting the index" do
    visit proveedores_url
    assert_selector "h1", text: "Proveedores"
  end

  test "creating a Proveedore" do
    visit proveedores_url
    click_on "New Proveedore"

    fill_in "Direccion", with: @proveedore.direccion
    fill_in "Email", with: @proveedore.email
    fill_in "Prov Activo", with: @proveedore.prov_activo
    fill_in "Razon Social", with: @proveedore.razon_social
    fill_in "Ruc", with: @proveedore.ruc
    fill_in "Telefono", with: @proveedore.telefono
    click_on "Create Proveedore"

    assert_text "Proveedore was successfully created"
    click_on "Back"
  end

  test "updating a Proveedore" do
    visit proveedores_url
    click_on "Edit", match: :first

    fill_in "Direccion", with: @proveedore.direccion
    fill_in "Email", with: @proveedore.email
    fill_in "Prov Activo", with: @proveedore.prov_activo
    fill_in "Razon Social", with: @proveedore.razon_social
    fill_in "Ruc", with: @proveedore.ruc
    fill_in "Telefono", with: @proveedore.telefono
    click_on "Update Proveedore"

    assert_text "Proveedore was successfully updated"
    click_on "Back"
  end

  test "destroying a Proveedore" do
    visit proveedores_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Proveedore was successfully destroyed"
  end
end
