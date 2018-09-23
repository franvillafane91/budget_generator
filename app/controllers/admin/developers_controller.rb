module Admin
  class DevelopersController < BaseController
    def index
      @developers = Developer.all
    end

    def new
      @developer = Developer.new
    end

    def create
      @developer = Developer.new(dev_params)

      if @developer.update(dev_params)
        redirect_to admin_developers_path, notice: 'Desarrollador creado.'
      else
        redirect_to new_admin_developer_path, notice: 'Hubo un error.'
      end
    end

    def edit
      @developer = Developer.find(params[:id])
    end

    def update
      @developer = Developer.find(params[:id])

      if @developer.update(dev_params)
        redirect_to admin_developers_path, notice: 'Desarrollador modificado.'
      else
        redirect_to new_admin_developer_path, notice: 'Hubo un error.'
      end
    end

    def destroy
      @developer = Developer.find(params[:id])

      if @developer.destroy
        notice = 'Desarrollador eliminado.'
      else
        notice = 'Hubo un error.'
      end
      redirect_to admin_developers_path, notice: notice
    end

    private
    def dev_params
      params.require(:developer).permit(:email, :name)
    end
  end
end
