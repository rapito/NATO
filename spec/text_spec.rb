require "spec_helper"

module NATO
  RSpec.describe Text do
    Given(:text) { Text.new "a8h43lnr0" }

    describe "#to_nato" do
      Then do
        expect(text.to_nato).to eq \
          "Alfa Eight Hotel Four Three Lima November Romeo Zero"
      end

      it "should join with default 'as in'"  do
        res = Text.new('VJ980', humanized: true).to_s

        expected_result = "V as in Victor, J as in Juliet, Nine, Eight, Zero"
        expect(res).to eql expected_result
      end

      it "should separate with custom separator"  do

      end
    end

    describe "#to_s" do
      Given { allow(text).to receive(:to_nato) }

      Then do
        expect(text.to_s).to eq \
          "Alfa Eight Hotel Four Three Lima November Romeo Zero"
      end
    end

    describe "#pronunciation" do
      Then do
        expect(text.pronunciation).to eq \
          "AL-FAH AIT HOH-TEL FOW-ER TREE LEE-MAH NO-VEM-BER ROW-ME-OH ZEE-RO"
      end
    end
  end
end
