require "application_system_test_case"

class ProductFeaturesTest < ApplicationSystemTestCase
  setup do
    @product_feature = product_features(:one)
  end

  test "visiting the index" do
    visit product_features_url
    assert_selector "h1", text: "Product features"
  end

  test "should create product feature" do
    visit product_features_url
    click_on "New product feature"

    click_on "Create Product feature"

    assert_text "Product feature was successfully created"
    click_on "Back"
  end

  test "should update Product feature" do
    visit product_feature_url(@product_feature)
    click_on "Edit this product feature", match: :first

    click_on "Update Product feature"

    assert_text "Product feature was successfully updated"
    click_on "Back"
  end

  test "should destroy Product feature" do
    visit product_feature_url(@product_feature)
    click_on "Destroy this product feature", match: :first

    assert_text "Product feature was successfully destroyed"
  end
end
