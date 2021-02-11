describe "Get an environment" do
  before do
    td.create_environment("test", label: "Test", uuid: "1234", contacts: [ { name: "Foo" } ] )
  end
  let(:path) { "/environments/1234" }
  let(:headers) { {'HTTP_ACCEPT' => 'application/hal+json'} }
  let(:response_body) { JSON.parse(subject.body, symbolize_names: true)}

  subject { get(path, nil, headers) }

  it { is_expected.to be_a_hal_json_success_response }

  it "returns the environment" do
    expect(response_body[:uuid]).to eq "1234"
    expect(response_body[:name]).to eq "test"
  end
end
