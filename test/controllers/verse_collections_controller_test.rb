require "test_helper"

class VerseCollectionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @verse_collection = verse_collections(:one)
  end

  test "should get index" do
    get verse_collections_url
    assert_response :success
  end

  test "should get new" do
    get new_verse_collection_url
    assert_response :success
  end

  test "should create verse_collection" do
    assert_difference("VerseCollection.count") do
      post verse_collections_url, params: { verse_collection: { comment: @verse_collection.comment } }
    end

    assert_redirected_to verse_collection_url(VerseCollection.last)
  end

  test "should show verse_collection" do
    get verse_collection_url(@verse_collection)
    assert_response :success
  end

  test "should get edit" do
    get edit_verse_collection_url(@verse_collection)
    assert_response :success
  end

  test "should update verse_collection" do
    patch verse_collection_url(@verse_collection), params: { verse_collection: { comment: @verse_collection.comment } }
    assert_redirected_to verse_collection_url(@verse_collection)
  end

  test "should destroy verse_collection" do
    assert_difference("VerseCollection.count", -1) do
      delete verse_collection_url(@verse_collection)
    end

    assert_redirected_to verse_collections_url
  end
end
