class MoosesController < ApplicationController
  # GET /mooses
  # GET /mooses.json
  def index
    @mooses = Moose.all

    @h = LazyHighCharts::HighChart.new('graph') do |f|
      f.options[:chart][:defaultSeriesType] = "area"
      f.series(:name=>'John', :data=>[3, 20, 3, 5, 4, 10, 12 ,3, 5,6,7,7,80,9,9])
      f.series(:name=>'Jane', :data=> [1, 3, 4, 3, 3, 5, 4,-46,7,8,8,9,9,0,0,9] )
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @mooses }
    end
  end

  # GET /mooses/1
  # GET /mooses/1.json
  def show
    @moose = Moose.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @moose }
    end
  end

  # GET /mooses/new
  # GET /mooses/new.json
  def new
    @moose = Moose.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @moose }
    end
  end

  # GET /mooses/1/edit
  def edit
    @moose = Moose.find(params[:id])
  end

  # POST /mooses
  # POST /mooses.json
  def create
    @moose = Moose.new(params[:moose])

    respond_to do |format|
      if @moose.save
        format.html { redirect_to @moose, notice: 'Moose was successfully created.' }
        format.json { render json: @moose, status: :created, location: @moose }
      else
        format.html { render action: "new" }
        format.json { render json: @moose.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /mooses/1
  # PUT /mooses/1.json
  def update
    @moose = Moose.find(params[:id])

    respond_to do |format|
      if @moose.update_attributes(params[:moose])
        format.html { redirect_to @moose, notice: 'Moose was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @moose.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mooses/1
  # DELETE /mooses/1.json
  def destroy
    @moose = Moose.find(params[:id])
    @moose.destroy

    respond_to do |format|
      format.html { redirect_to mooses_url }
      format.json { head :no_content }
    end
  end
end
