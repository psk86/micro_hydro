class ConsumersController < ApplicationController
  before_action :set_consumer, only: [:show, :edit, :update, :destroy]

  # GET /consumers
  # GET /consumers.json
  def index
    @consumers = Consumer.all
  end

  # GET /consumers/1
  # GET /consumers/1.json
  def show
    #redirect_to "/consumers/#{params[:id]}/edit", consumer_id: params[:id], remote: true
  end

  # GET /consumers/new
  def new
    @consumer = Consumer.new
  end

  # GET /consumers/1/edit
  def edit
    @row_id = params[:id]
    respond_to do |format|
      format.js { render "edit"}
      format.html { render "edit"}
    end
  end

    # GET /consumers/1/edit
  def edit_monthly_consumptions
    @row_id = params[:id]
    respond_to do |format|
      format.js { render "edit"}
      format.html { render "edit"}
    end
  end

  # POST /consumers
  # POST /consumers.json
  def create
    @consumer = Consumer.new(consumer_params)

    respond_to do |format|
      if @consumer.save
        format.html { redirect_to @consumer, notice: 'Consumer was successfully created.' }
        format.json { render :show, status: :created, location: @consumer }
      else
        format.html { render :new }
        format.json { render json: @consumer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /consumers/1
  # PATCH/PUT /consumers/1.json
  def update
    @row_id = params[:id]
    respond_to do |format|
      if @consumer.update(consumer_params)
        #format.html { redirect_to @consumer, notice: 'Consumer was successfully updated.' }
        #format.html { redirect_to '/', notice: 'Consumer was successfully updated.' }
        #format.json { render :show, status: :ok, location: @consumer }
        format.js { render "update_consumer_result_child_row.js.erb", consumer: @consumer, notice: 'Consumer was successfully updated.'}
      else
        #format.html { render :edit }
        #format.json { render json: @consumer.errors, status: :unprocessable_entity }
        format.js { render :file => "update_consumer_result_child_row.js.erb", consumer: @consumer }
      end
    end
  end

  # DELETE /consumers/1
  # DELETE /consumers/1.json
  def destroy
    @consumer.destroy
    respond_to do |format|
      format.html { redirect_to consumers_url, notice: 'Consumer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_consumer
      @consumer = Consumer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def consumer_params
      params.require(:consumer).permit(:first_name, :middle_name, :last_name, :dob, :gender, :email, :phone1, :phone2, :address_1, :address_2, :city, :district, :state, :zipcode, :country, :consumer_type)
    end
end
