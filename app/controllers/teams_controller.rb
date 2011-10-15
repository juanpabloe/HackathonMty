class TeamsController < ApplicationController

  def index
    @teams = Team.all
  end

  def create
    @team = Team.new(params[:team])
    @team.rescue_members
    if @team.save
      redirect_to root_path, :notice => "Bienvenidos a Hackathon! El equipo #{@team.name} fue dado de alta, recibiran un correo en el transcurso del dia."
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

  def ratings
    @teams = Team.all
  end

  def rate
    @team = Team.find(params[:id])
    @team.rate(params[:stars], current_member, params[:dimension])
  end

end
