module Admin
  class BudgetPdfController < BaseController
    def show
      @budget = Budget.find(params[:id])

      # render pdf: "#{@budget.client_name}-#{@budget.project_name}"
      render template: 'admin/budget_pdf/show',
              pdf: "#{@budget.client_name}-#{@budget.project_name}",
              layout: 'wicked_pdf.html.erb',
              disposition: 'inline'
    end
  end
end
