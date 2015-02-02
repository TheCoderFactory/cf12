require 'test_helper'

class AuthorsControllerTest < ActionController::TestCase
  setup do
    @author = authors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:authors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create author" do
    assert_difference('Author.count') do
      post :create, author: { github: @author.github, google_plus: @author.google_plus, info: @author.info, linkedin: @author.linkedin, name: @author.name, profile_picture: @author.profile_picture, slug: @author.slug, title: @author.title, twitter: @author.twitter, website: @author.website }
    end

    assert_redirected_to author_path(assigns(:author))
  end

  test "should show author" do
    get :show, id: @author
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @author
    assert_response :success
  end

  test "should update author" do
    patch :update, id: @author, author: { github: @author.github, google_plus: @author.google_plus, info: @author.info, linkedin: @author.linkedin, name: @author.name, profile_picture: @author.profile_picture, slug: @author.slug, title: @author.title, twitter: @author.twitter, website: @author.website }
    assert_redirected_to author_path(assigns(:author))
  end

  test "should destroy author" do
    assert_difference('Author.count', -1) do
      delete :destroy, id: @author
    end

    assert_redirected_to authors_path
  end
end
