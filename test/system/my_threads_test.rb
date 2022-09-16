require "application_system_test_case"

class MyThreadsTest < ApplicationSystemTestCase
  setup do
    @my_thread = my_threads(:one)
  end

  test "visiting the index" do
    visit my_threads_url
    assert_selector "h1", text: "My threads"
  end

  test "should create my thread" do
    visit my_threads_url
    click_on "New my thread"

    fill_in "Title", with: @my_thread.title
    click_on "Create My thread"

    assert_text "My thread was successfully created"
    click_on "Back"
  end

  test "should update My thread" do
    visit my_thread_url(@my_thread)
    click_on "Edit this my thread", match: :first

    fill_in "Title", with: @my_thread.title
    click_on "Update My thread"

    assert_text "My thread was successfully updated"
    click_on "Back"
  end

  test "should destroy My thread" do
    visit my_thread_url(@my_thread)
    click_on "Destroy this my thread", match: :first

    assert_text "My thread was successfully destroyed"
  end
end
