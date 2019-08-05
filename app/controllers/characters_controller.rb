class CharactersController < ApplicationController
  def xp
    char = Character.new(
      skill_ids: Array.wrap(params[:skill_ids]),
      body: params[:body] || 0,
      mind: params[:mind] || 0,
      resolve: params[:resolve] || 0,
      infection: params[:infection] || 0,
    )
    char.validates_dependencies
    errors = char.errors.messages
    render json: {
      stat_xp: char.compute_stat_xp,
      skill_xp: errors.length > 0 ? nil : char.compute_skill_xp,
      errors: errors,
    }
  end
end
