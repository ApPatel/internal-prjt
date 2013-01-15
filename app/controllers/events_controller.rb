class EventsController < ApplicationController
  # GET /events
  # GET /events.json

  def index
   # @events = Event.all
  # @users = User.order(:name).page params[:page]
  #@events = Event.order("name")
    @events = Event.order("id asc").page( params[:page]).per(5)
  #@events = Event.all
   
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @events }
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show

    @event = Event.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/new
  # GET /events/new.json
  def new
    @event = Event.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
  end

  # POST /events
  # POST /events.json
  def create
      @event = Event.new(params[:event])
       if (params[:event][:attachment_file])
       uploaded_io = params[:event][:attachment_file]
       name=uploaded_io.original_filename
       @event.attachment_file=name
     end
    if (params[:new_sub_category])
     
       @sub_category = SubCategory.create!(:name =>params[:new_sub_category])
       @event.sub_category_id=@sub_category.id
    end
    
    respond_to do |format|
      if @event.save
      if uploaded_io
       @latestevent=Event.last
       id=@latestevent.id
       
       finalname=[id,name].join(",")
       
     
       File.open(Rails.root.join('public', 'data', finalname), 'w') do |file|
       file.write(uploaded_io.read)
      end
    end
    
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render json: @event, status: :created, location: @event }
      else
        format.html { render action: "new" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.json
  def update
    @event = Event.find(params[:id])
    uploaded_io = params[:event][:attachment_file] 
    if (params[:new_sub_category])
     
       @sub_category = SubCategory.create!(:name =>params[:new_sub_category])
       @event.sub_category_id=@sub_category.id
    end
   
    params[:event].delete('attachment_file')
    params[:event].delete('sub_category_id')
    respond_to do |format|
      if @event.update_attributes(params[:event])
        if uploaded_io
              name=uploaded_io.original_filename
        Event.find(@event.id).update_attributes(:attachment_file =>name)

           
           finalname=[@event.id,name].join(",")           
         
           File.open(Rails.root.join('public', 'data', finalname), 'w') do |file|
              file.write(uploaded_io.read)
            end
        end
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end
  def download_file
    @event = Event.find(params[:id])
    finalname=[params[:id],@event.attachment_file].join(",")
    send_file "public/data/#{finalname}" 
  end

   def other_sub_category
     render :text => '<input type="text" id="new_sub_category" name="new_sub_category">'
   end
   def delete_file
      event_id=params[:id]
      # event=Event.find(event_id).update_attribute('attachment_file', nil)
      event=Event.find(event_id).update_attributes!(:attachment_file =>nil)
      render :text => ''
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :no_content }
    end

  end
  def search
    if params[:search]==""
      
       @events = SubCategory.find(params[:sub_category_id]).events.page(params[:page]).per(5)
      #@events=SubCategory.events
    else

    @events=Event.where("name like ?","%#{params[:search]}%").page(params[:page]).per(5)
     end 
    render :layout=>false

  end
end
