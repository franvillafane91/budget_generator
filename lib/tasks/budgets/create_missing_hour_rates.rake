namespace :budgets do
  desc "create missing hour rates"
  task create_missing_hour_rates: :environment do
    Budget.find_in_batches(batch_size: 100) do |group|
      group.each do |budget|
        next unless budget.hour_rate.blank?
        begin
          budget.create_hour_rate
          puts "."
        rescue
          puts "F:Budget: #{budget.id}"
        end
      end
    end
  end
end
