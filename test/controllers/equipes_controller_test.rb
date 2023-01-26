require "test_helper"

class EquipesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @equipe = equipes(:one)
  end

  test "should get index" do
    get equipes_url, as: :json
    assert_response :success
  end

  test "should create equipe" do
    assert_difference("Equipe.count") do
      post equipes_url, params: { equipe: { imagem: @equipe.imagem, nome: @equipe.nome, total_ataque: @equipe.total_ataque, total_defesa: @equipe.total_defesa, total_jogadores: @equipe.total_jogadores, total_meio: @equipe.total_meio } }, as: :json
    end

    assert_response :created
  end

  test "should show equipe" do
    get equipe_url(@equipe), as: :json
    assert_response :success
  end

  test "should update equipe" do
    patch equipe_url(@equipe), params: { equipe: { imagem: @equipe.imagem, nome: @equipe.nome, total_ataque: @equipe.total_ataque, total_defesa: @equipe.total_defesa, total_jogadores: @equipe.total_jogadores, total_meio: @equipe.total_meio } }, as: :json
    assert_response :success
  end

  test "should destroy equipe" do
    assert_difference("Equipe.count", -1) do
      delete equipe_url(@equipe), as: :json
    end

    assert_response :no_content
  end
end
