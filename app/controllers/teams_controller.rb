class TeamsController < ApplicationController

  def index
    @teams = Team.all
  end

  def create
    @team = Team.new(params[:team])
    if @team.save
      redirect_to root_path, :notice => "El equipo #{@team.name} fue dado de alta, recibiran un correo pronto."
    else
      flash.now[:error] = "#{@team.errors.full_messages.join ','}"
    end
  end

  def update
    @team = Team.find(params[:id])

    respond_to do |format|
      if @team.update_attributes(params[:team])
        format.html { redirect_to @team, notice: 'Team was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

end
