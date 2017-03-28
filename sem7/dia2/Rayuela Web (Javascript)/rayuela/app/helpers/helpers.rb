helpers do
  def get_winners(params)
    # Filtra juegos ganados contra otros jugadores
    games_from_users = Batch.where(user_id: params[:players]).select("distinct(game_id)").collect {|column| column.game_id}

    # Juegos ganados de los usuarios actuales filtrando otros usuarios por games_from_users
    Game.where(user_id: params[:players], id: games_from_users).select("count(user_id) as wins", "user_id").group(:user_id)
  end
end
