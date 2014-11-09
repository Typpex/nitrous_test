require "test_helper"

describe Admin::ScammersController do
  describe "GET index" do 
    before do 
      get :index
    end

    it "renders admin/scammers/index" do 
      must_render_template "admin/scammers/index"
    end

    it "responds with success" do 
      must_respond_with :success
    end

    it "must contains at least one scammer" do 
      assert_equal 1, assigns(:scammers).size
    end
 
    it "must destroy the given scammer" do 
      assert_routing({method: "delete", path: "admin/scammers/1"}, {controller: "admin/scammers", action: "destroy", id: "1"})
      assert_difference "Scammer.count", -1 do 
        delete :destroy, id: "#{assigns(:scammers).first.id}"
      end
    end

    it "create a scammer" do 
      assert_difference "Scammer.count", 1 do
        post :create, {scammer: {name: Faker::Name.name }}
      end
    end

    it "edit a scammer" do 
      scammer = Scammer.first
      patch :update, {id: scammer.id, scammer: {name: Faker::Name.name, licence: "test"}}
    end
  end
end
