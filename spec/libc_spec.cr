require "./spec_helper"

describe Bluetooth do
  it "baswap" do
    a = Bluetooth.bswap(0x123456789abcdef)
    a.should eq(2541551698909720525)
  end
end
