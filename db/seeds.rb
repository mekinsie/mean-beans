class Seed

  def self.begin
    Coffee.destroy_all
    seed = Seed.new
    seed.generate_coffees
  end

  def generate_coffees
    FactoryBot.create_list(:coffee, 20)
    puts "Created #{Coffee.count} coffees."
  end
end

Seed.begin
