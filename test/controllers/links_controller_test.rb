require 'test_helper'

class LinksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @link = links(:one)
    get new_user_session_url
    sign_in users(:one)
    post user_session_url    
  end
  
  test "links header" do
    get links_url
    assert_select 'h1', "Links"
  end

  test "should get index" do
    get links_url
    assert_response :success
    assert_select 'h1', "Links"
  end

  test "should get new" do
    get new_link_url
    assert_response :success
    assert_select "form input", 4
  end
  
  test "form fields name" do
    get new_link_url
    assert_select "form input" do
      assert_select "[name]", /.+/  # Not empty
    end
  end

  test "should create link" do
    assert_difference('Link.count') do
      post links_url, params: { link: { title: @link.title, url: @link.url } }
    end

    assert_redirected_to link_url(Link.last)
  end
  
  test "create and view link" do
    # new_link -> links#new
    get new_link_url
    assert_response :success
    
    # links GET -> links#index, links POST -> links#create
    post links_url, params: { link: { title: "Test link", url: "success.com"} }
    assert_response :redirect
    follow_redirect!
    assert_response :success
  end

  test "should show link" do
    get link_url(@link)
    assert_response :success
  end
 
  test "should get edit" do
    get edit_link_url(@link)
    assert_response :success
  end

  test "should update link" do
    patch link_url(@link), params: { link: { title: @link.title, url: @link.url } }
    assert_redirected_to link_url(@link)
  end

  test "should destroy link" do
    assert_difference('Link.count', -1) do
      delete link_url(@link)
    end

    assert_redirected_to links_url
  end
end
