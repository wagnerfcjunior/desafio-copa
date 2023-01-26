require "test_helper"

class PartidasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @partida = partidas(:one)
  end

  test "should get index" do
    get partidas_url, as: :json
    assert_response :success
  end

  test "should create partida" do
    assert_difference("Partida.count") do
      post partidas_url, params: { partida: { data_partida: @partida.data_partida, equipe_id: @partida.equipe_id, time1: @partida.time1, time2: @partida.time2, vencedor: @partida.vencedor } }, as: :json
    end

    assert_response :created
  end

  test "should show partida" do
    get partida_url(@partida), as: :json
    assert_response :success
  end

  test "should update partida" do
    patch partida_url(@partida), params: { partida: { data_partida: @partida.data_partida, equipe_id: @partida.equipe_id, time1: @partida.time1, time2: @partida.time2, vencedor: @partida.vencedor } }, as: :json
    assert_response :success
  end

  test "should destroy partida" do
    assert_difference("Partida.count", -1) do
      delete partida_url(@partida), as: :json
    end

    assert_response :no_content
  end
end
