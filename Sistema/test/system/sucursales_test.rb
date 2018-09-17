require "application_system_test_case"

class SucursalesTest < ApplicationSystemTestCase
  setup do
    @sucursale = sucursales(:one)
  end

  test "visiting the index" do
    visit sucursales_url
    assert_selector "h1", text: "Sucursales"
  end

  test "creating a Sucursale" do
    visit sucursales_url
    click_on "New Sucursale"

    fill_in "Suc Activo", with: @sucursale.suc_activo
    fill_in "Suc Descrip", with: @sucursale.suc_descrip
    click_on "Create Sucursale"

    assert_text "Sucursale was successfully created"
    click_on "Back"
  end

  test "updating a Sucursale" do
    visit sucursales_url
    click_on "Edit", match: :first

    fill_in "Suc Activo", with: @sucursale.suc_activo
    fill_in "Suc Descrip", with: @sucursale.suc_descrip
    click_on "Update Sucursale"

    assert_text "Sucursale was successfully updated"
    click_on "Back"
  end

  test "destroying a Sucursale" do
    visit sucursales_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Sucursale was successfully destroyed"
  end
end
