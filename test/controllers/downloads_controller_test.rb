require "test_helper"

class DownloadsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @download = downloads(:one)
  end

  test "should get index" do
    get downloads_url, as: :json
    assert_response :success
  end

  test "should create download" do
    assert_difference("Download.count") do
      post downloads_url, params: { download: { song: @download.song, time: @download.time } }, as: :json
    end

    assert_response :created
  end

  test "should show download" do
    get download_url(@download), as: :json
    assert_response :success
  end

  test "should update download" do
    patch download_url(@download), params: { download: { song: @download.song, time: @download.time } }, as: :json
    assert_response :success
  end

  test "should destroy download" do
    assert_difference("Download.count", -1) do
      delete download_url(@download), as: :json
    end

    assert_response :no_content
  end
end
