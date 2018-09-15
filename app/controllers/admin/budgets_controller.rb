module Admin
  class BudgetsController < BaseController
    def index
      @budgets = Budget.all
    end

    def new
      @budget = Budget.new
      @budget.build_client
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
                      client_attributes: client_params
                      )
    end

    def client_params
      [:name, :email]
    end
  end
end
