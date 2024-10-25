class Admin::SignageDevicesController < AdminController
  def new
    @signage_device = SignageDevice.new
  end

  def edit
    @signage_device = SignageDevice.find(params[:id])
  end

  def create
    signage_device = SignageDevice.new(**signage_device_params)
    if signage_device.save
      flash.now[:success] = "Create signage device successful"
      redirect_to admin_signages_path
    else
      flash.now[:error] = "Create signage device failed"
      redirect_to new_admin_signage_device_path
    end
  end

  def update
    signage_device = SignageDevice.find(params[:id])
    if signage_device.update(**signage_device_params)
      flash.now[:success] = "Update signage device successful"
      redirect_to admin_signages_path
    else
      flash.now[:error] = "Update signage device failed"
      redirect_to new_admin_signage_device_path
    end
  end

  private def signage_device_params
    params.require(:signage_device).permit(:device_name)
  end
end