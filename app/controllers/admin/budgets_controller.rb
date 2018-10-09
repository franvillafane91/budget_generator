module Admin
  class BudgetsController < BaseController
    def index
      @budgets = Budget.all
    end

    def new
      @budget = Budget.new
      @budget.build_client
      @budget.build_project
      @budget.budget_items.build
    end

    def create
      @budget = Budget.new(budget_params)

      if @budget.save
        redirect_to admin_budgets_path, notice: 'Presupuesto creado'
      else
        redirect_to new_admin_budget_path, notice: 'Hubo un error'
      end
    end

    def edit
      @budget = Budget.find(params[:id])
    end

    def update
      @budget = Budget.find(params[:id])

      if @budget.update(budget_params)
        redirect_to admin_budgets_path, notice: 'Presupuesto modificado'
      else
        redirect_to edit_admin_budget_path(@budget), notice: 'Hubo un error'
      end
    end

    def destroy
      @budget = Budget.find(params[:id])

      if @budget.destroy
        notice = 'Presupuesto eliminado'
      else
        notice = 'Hubo un error'
      end
      redirect_to admin_budgets_path, notice: notice
    end

    private
    def budget_params
      params.require(:budget).permit(:send_date, :total_amount, :estimated_time,
                      :developer_id, :show_missing_info_clarification,
                      client_attributes: client_params,
                      project_attributes: project_params,
                      budget_items_attributes: budget_items_params )
    end

    def client_params
      [:name, :email]
    end

    def project_params
      [:name, :description]
    end

    def budget_items_params
      [:id, :title, :description, :_destroy]
    end
  end
end
