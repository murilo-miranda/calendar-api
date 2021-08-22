class Event #PORO
  attr_reader :name, :guests, :start_at, :end_at, :local, :owner, :description

  def initialize(name:, guests: [], start_at:, end_at:, local:, owner:, description:)
    @name = name
    @guests = guests
    @start_at = start_at
    @end_at = end_at
    @local = local
    @owner = owner
    @description = description
  end

  def self.all
    $db
  end
end