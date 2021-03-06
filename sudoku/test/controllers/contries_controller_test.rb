require 'test_helper'

class ContriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @contry = contries(:one)
  end

  test "should get index" do
    get contries_url
    assert_response :success
  end

  test "should get new" do
    get new_contry_url
    assert_response :success
  end

  test "should create contry" do
    assert_difference('Contry.count') do
      post contries_url, params: { contry: { area: @contry.area, center: @contry.center, cont_image: @contry.cont_image, cont_name: @contry.cont_name, continent: @contry.continent, lang: @contry.lang, money: @contry.money, pop: @contry.pop, religion: @contry.religion } }
    end

    assert_redirected_to contry_url(Contry.last)
  end

  test "should show contry" do
    get contry_url(@contry)
    assert_response :success
  end

  test "should get edit" do
    get edit_contry_url(@contry)
    assert_response :success
  end

  test "should update contry" do
    patch contry_url(@contry), params: { contry: { area: @contry.area, center: @contry.center, cont_image: @contry.cont_image, cont_name: @contry.cont_name, continent: @contry.continent, lang: @contry.lang, money: @contry.money, pop: @contry.pop, religion: @contry.religion } }
    assert_redirected_to contry_url(@contry)
  end

  test "should destroy contry" do
    assert_difference('Contry.count', -1) do
      delete contry_url(@contry)
    end

    assert_redirected_to contries_url
  end
end
