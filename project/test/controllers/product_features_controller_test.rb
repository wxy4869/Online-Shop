require "test_helper"

class ProductFeaturesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product_feature = product_features(:one)
  end

  test "should get index" do
    get product_features_url
    assert_response :success
  end

  test "should get new" do
    get new_product_feature_url
    assert_response :success
  end

  test "should create product_feature" do
    assert_difference("ProductFeature.count") do
      post product_features_url, params: { product_feature: {  } }
    end

    assert_redirected_to product_feature_url(ProductFeature.last)
  end

  test "should show product_feature" do
    get product_feature_url(@product_feature)
    assert_response :success
  end

  test "should get edit" do
    get edit_product_feature_url(@product_feature)
    assert_response :success
  end

  test "should update product_feature" do
    patch product_feature_url(@product_feature), params: { product_feature: {  } }
    assert_redirected_to product_feature_url(@product_feature)
  end

  test "should destroy product_feature" do
    assert_difference("ProductFeature.count", -1) do
      delete product_feature_url(@product_feature)
    end

    assert_redirected_to product_features_url
  end
end
