require 'test_helper'

class McqsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mcq = mcqs(:one)
  end

  test "should get index" do
    get mcqs_url
    assert_response :success
  end

  test "should get new" do
    get new_mcq_url
    assert_response :success
  end

  test "should create mcq" do
    assert_difference('Mcq.count') do
      post mcqs_url, params: { mcq: { correctOption: @mcq.correctOption, moreInfo: @mcq.moreInfo, optionA: @mcq.optionA, optionB: @mcq.optionB, optionC: @mcq.optionC, optionD: @mcq.optionD, optionE: @mcq.optionE, question: @mcq.question } }
    end

    assert_redirected_to mcq_url(Mcq.last)
  end

  test "should show mcq" do
    get mcq_url(@mcq)
    assert_response :success
  end

  test "should get edit" do
    get edit_mcq_url(@mcq)
    assert_response :success
  end

  test "should update mcq" do
    patch mcq_url(@mcq), params: { mcq: { correctOption: @mcq.correctOption, moreInfo: @mcq.moreInfo, optionA: @mcq.optionA, optionB: @mcq.optionB, optionC: @mcq.optionC, optionD: @mcq.optionD, optionE: @mcq.optionE, question: @mcq.question } }
    assert_redirected_to mcq_url(@mcq)
  end

  test "should destroy mcq" do
    assert_difference('Mcq.count', -1) do
      delete mcq_url(@mcq)
    end

    assert_redirected_to mcqs_url
  end
end
