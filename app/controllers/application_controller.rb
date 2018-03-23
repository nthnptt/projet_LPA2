class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected
  def format_creation(object)
    respond_to do |format|
      if object.save
        format.html { redirect_to object, notice: 'Object was successfully created.' }
        format.json { render :show, status: :created, location: object }
      else
        format.html { render :new }
        format.json { render json: object.errors, status: :unprocessable_entity }
      end
    end
  end

  def format_update(object,params)
    respond_to do |format|
      if object.update(params)
        format.html { redirect_to object, notice: 'Town was successfully updated.' }
        format.json { render :show, status: :ok, location: object }
      else
        format.html { render :edit }
        format.json { render json: object.errors, status: :unprocessable_entity }
      end
    end
  end
end
