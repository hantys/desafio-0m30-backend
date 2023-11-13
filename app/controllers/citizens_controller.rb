class CitizensController < ApplicationController
  before_action :set_citizen, only: %i[show edit update destroy]

  # GET /citizens or /citizens.json
  def index
    @q = Citizen.includes([:address ,avatar_attachment: [:blob]]).ransack(params[:q])
    @q.sorts = 'id desc' if @q.sorts.empty?
    @citizens = @q.result.page(params[:page])
  end

  # GET /citizens/1 or /citizens/1.json
  def show; end

  # GET /citizens/new
  def new
    @citizen = Citizen.new
    @citizen.build_address
  end

  # GET /citizens/1/edit
  def edit
    @citizen.build_address if @citizen.address.nil?
  end

  # POST /citizens or /citizens.json
  def create
    @citizen = Citizen.new(citizen_params)

    respond_to do |format|
      if @citizen.save
        format.html { redirect_to citizens_url, notice: "Citizen was successfully created." }
        format.json { render :show, status: :created, location: @citizen }
      else
        format.html do
          @citizen.build_address if @citizen.address.nil?
          render :new, status: :unprocessable_entity
        end
        format.json { render json: @citizen.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /citizens/1 or /citizens/1.json
  def update
    respond_to do |format|
      if @citizen.update(citizen_params)
        format.html { redirect_to citizens_url, notice: "Citizen was successfully updated." }
        format.json { render :show, status: :ok, location: @citizen }
      else
        format.html do
          @citizen.build_address if @citizen.address.nil?
          render :edit, status: :unprocessable_entity
        end
        format.json { render json: @citizen.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /citizens/1 or /citizens/1.json
  def destroy
    @citizen.destroy!

    respond_to do |format|
      format.html { redirect_to citizens_url, notice: "Citizen was successfully destroyed.", status: :no_content }
      format.turbo_stream do
        @citizen.reload
        render turbo_stream: turbo_stream.replace(
          "partial_citizen_#{params[:id]}",
          partial: 'citizens/citizen',
          locals: { citizen: @citizen }
        )
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_citizen
    @citizen = Citizen.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def citizen_params
    params.require(:citizen).permit(
      :full_name, :document_number, :cns, :email,
      :birth_date, :avatar, :remove_avatar, :phone_number, :country_code,
      address_attributes: %i[
        cep
        street
        number
        neighborhood
        complement
        ibge
        city
        state
      ]
    )
  end
end
