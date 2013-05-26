namespace :export do
  desc "Prints all ActiveModel data in seed.rb file."
  task :seed_format => :environment do
    Contract.order(:id).all.each do |contract|
      #puts "Contract.create(#{contract.serializable_hash.delete_if {|key, value| ['created_at', 'updated_at', 'id'].include?(key)}.to_s.gsub(/[{}]/,"")})"
      puts "Contract.create(#{contract.serializable_hash.delete_if {|key, value| ['created_at', 'updated_at', 'id'].include?(key)}.to_s})"
    end

  end
end
