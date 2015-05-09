require "spec_helper"

describe Lita::Handlers::Rageface, lita_handler: true do
  it { is_expected.to route_command("rage super rage").to(:rage) }

  before do
    registry.config.handlers.rageface.sort_key = :views
    registry.config.handlers.rageface.image_key = :png
  end

  describe "search" do
    it "returns super rage face" do
      send_message("rage super rage")
      expect(replies).to eq([ "http://cdn.alltheragefaces.com/img/faces/png/rage-super-rage.png" ])
    end

    it "returns not found message" do
      send_message("rage this_query_should_return_empty_result")
      expect(replies).to eq([ "No Results Found" ])
    end
  end
end
