class CharactersController < ApplicationController
  def xp
    char = Character.new(skill_ids: params[:skill_ids])
    char.validates_dependencies
    errors = char.errors.messages
    render json: {
      skill_xp: errors.length > 0 ? nil : char.compute_skill_xp,
      errors: errors,
    }
  end
end
