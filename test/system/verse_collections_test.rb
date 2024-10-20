require "application_system_test_case"

class VerseCollectionsTest < ApplicationSystemTestCase
  setup do
    @verse_collection = verse_collections(:one)
  end

  test "visiting the index" do
    visit verse_collections_url
    assert_selector "h1", text: "Verse collections"
  end

  test "should create verse collection" do
    visit verse_collections_url
    click_on "New verse collection"

    fill_in "Comment", with: @verse_collection.comment
    click_on "Create Verse collection"

    assert_text "Verse collection was successfully created"
    click_on "Back"
  end

  test "should update Verse collection" do
    visit verse_collection_url(@verse_collection)
    click_on "Edit this verse collection", match: :first

    fill_in "Comment", with: @verse_collection.comment
    click_on "Update Verse collection"

    assert_text "Verse collection was successfully updated"
    click_on "Back"
  end

  test "should destroy Verse collection" do
    visit verse_collection_url(@verse_collection)
    click_on "Destroy this verse collection", match: :first

    assert_text "Verse collection was successfully destroyed"
  end
end
