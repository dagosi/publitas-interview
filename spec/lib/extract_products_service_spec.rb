require 'spec_helper'
require 'extract_products_service'

describe ExtractProductsService do
  let(:xml_file_path) { File.join(File.dirname(__FILE__), '..', 'files', 'mini.xml') }

  before do
    allow(described_class)
      .to receive(:feed_path)
      .and_return(xml_file_path)
  end

  it 'extracts all products in a format' do
    results = [
      { id: "4530607", title: "Blauwe jeans - skinny fit", description: "<html>Deze donkerblauwe jeans met oranje stiksels van Angels is een echte klassieker. Deze jeans kan je met elke blouse en elke trui uit je kleerkast dragen. De skinny fit, sluit mooi aan rond de benen. De broek is gemaakt van een elastische stof, waardoor hij als gegoten zit rond jouw lichaam. 5-pocketmodel met knop en rits.<br><br>Lengte binnenbeen ca. 77 cm bij maat 34. Skinny fit.</html>"},
      { id: "4532526", title: "Donkerblauwe denim met slangenprint - straight fit", description: "<html>Funky, deze donkerblauwe stretchdenim met subtiele slangenprint. De print in reliëf geeft de broek pit en karakter. Een handig 5-pocketmodel met zilverkleurige knop en rits. Straight fit.<br><br>Lengte binnenbeen ca. 80 cm bij W 34.</html>"},
      { id: "4530405", title: "Zwarte denim met strass - skinny fit", description: "<html>Een donkerblauwe denim met subtiele strass steentjes op de voorste steekzakken. Een handig 5-pocketmodel met zilverkleurige knop en rits. Skinny fit. <br><br>Lengte buitenbeen ca. 101 cm, binnenbeen ca. 74 cm bij W 34.</html>"},
      { id: "4530809", title: "Donkerblauwe denim met strass - straight fit", description: "<html>Een effen, donkerblauwe denim met subtiel schitterende strass op de achterzakken. Een handig 5-pocketmodel met zilverkleurige knop. Straight fit. <br><br>Lengte buitenbeen ca. 104 cm, binnenbeen ca. 80 cm bij W 34.</html>"},
      { id: "4531112", title: "Zwarte jeans - straight fit", description: "<html>Deze zwarte jeans van Angels draag je op alle kleuren. Elke kleerkast heeft dit exemplaar nodig. De broek is gemaakt van een elastiche stof, waardoor hij als gegoten zit rond jouw lichaam. 5-pocketmodel met knop en rits.<br><br>Lengte binnenbeen ca. 78 cm bij maat 38. Straight fit.</html>"}
    ]

    expect(described_class.run).to eq(results)
  end
end
