class FieldsController < ApplicationController
  def create
    @field = Field.new(field_params)
    @expert = Expert.find(params[:expert_id])
    @field.expert = @expert
    if @field.save
      flash[:notice] = "Especialidade adicionada"
    else
      flash[:alert] = @field.errors.messages.values.join('<br>')
    end
    redirect_to edit_expert_path(@expert)
  end

  def destroy
    @field = Field.find(params[:id])
    if @field.destroy
      flash[:notice] = 'Especialidade removida'
    else
      flash[:alert] = @field.errors.messages.values.join('<br>')
    end
    redirect_to edit_expert_path(@field.expert)
  end
  

  private

  def field_params
    params.require(:field).permit(:area, :reg_number, :title)
  end
end