#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xaddomain) do

  let :dsc_xaddomain do
    Puppet::Type.type(:dsc_xaddomain).new(
      :name     => 'foo',
      :dsc_domainname => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xaddomain.to_s).to eq("Dsc_xaddomain[foo]")
  end

  it 'should default to ensure => present' do
    expect(dsc_xaddomain[:ensure]).to eq :present
  end

  it 'should require that dsc_domainname is specified' do
    #dsc_xaddomain[:dsc_domainname]
    expect { Puppet::Type.type(:dsc_xaddomain).new(
      :name     => 'foo',
      :dsc_parentdomainname => 'foo',
      :dsc_domainadministratorcredential => 'foo',
      :dsc_safemodeadministratorpassword => 'foo',
      :dsc_dnsdelegationcredential => 'foo',
      :dsc_ensure => 'Present',
    )}.to raise_error(Puppet::Error, /dsc_domainname is a required attribute/)
  end

  it 'should not accept array for dsc_domainname' do
    expect{dsc_xaddomain[:dsc_domainname] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_domainname' do
    expect{dsc_xaddomain[:dsc_domainname] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_domainname' do
    expect{dsc_xaddomain[:dsc_domainname] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_domainname' do
    expect{dsc_xaddomain[:dsc_domainname] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_parentdomainname' do
    expect{dsc_xaddomain[:dsc_parentdomainname] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_parentdomainname' do
    expect{dsc_xaddomain[:dsc_parentdomainname] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_parentdomainname' do
    expect{dsc_xaddomain[:dsc_parentdomainname] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_parentdomainname' do
    expect{dsc_xaddomain[:dsc_parentdomainname] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_domainadministratorcredential' do
    expect{dsc_xaddomain[:dsc_domainadministratorcredential] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_domainadministratorcredential' do
    expect{dsc_xaddomain[:dsc_domainadministratorcredential] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_domainadministratorcredential' do
    expect{dsc_xaddomain[:dsc_domainadministratorcredential] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_domainadministratorcredential' do
    expect{dsc_xaddomain[:dsc_domainadministratorcredential] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_safemodeadministratorpassword' do
    expect{dsc_xaddomain[:dsc_safemodeadministratorpassword] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_safemodeadministratorpassword' do
    expect{dsc_xaddomain[:dsc_safemodeadministratorpassword] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_safemodeadministratorpassword' do
    expect{dsc_xaddomain[:dsc_safemodeadministratorpassword] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_safemodeadministratorpassword' do
    expect{dsc_xaddomain[:dsc_safemodeadministratorpassword] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_dnsdelegationcredential' do
    expect{dsc_xaddomain[:dsc_dnsdelegationcredential] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_dnsdelegationcredential' do
    expect{dsc_xaddomain[:dsc_dnsdelegationcredential] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_dnsdelegationcredential' do
    expect{dsc_xaddomain[:dsc_dnsdelegationcredential] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_dnsdelegationcredential' do
    expect{dsc_xaddomain[:dsc_dnsdelegationcredential] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_ensure predefined value Present' do
    dsc_xaddomain[:dsc_ensure] = 'Present'
    expect(dsc_xaddomain[:dsc_ensure]).to eq('Present')
  end

  it 'should accept dsc_ensure predefined value present' do
    dsc_xaddomain[:dsc_ensure] = 'present'
    expect(dsc_xaddomain[:dsc_ensure]).to eq('present')
  end

  it 'should accept dsc_ensure predefined value present and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xaddomain[:dsc_ensure] = 'present'
    expect(dsc_xaddomain[:ensure]).to eq(dsc_xaddomain[:dsc_ensure].downcase.to_sym)
  end

  it 'should accept dsc_ensure predefined value Absent' do
    dsc_xaddomain[:dsc_ensure] = 'Absent'
    expect(dsc_xaddomain[:dsc_ensure]).to eq('Absent')
  end

  it 'should accept dsc_ensure predefined value absent' do
    dsc_xaddomain[:dsc_ensure] = 'absent'
    expect(dsc_xaddomain[:dsc_ensure]).to eq('absent')
  end

  it 'should accept dsc_ensure predefined value absent and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xaddomain[:dsc_ensure] = 'absent'
    expect(dsc_xaddomain[:ensure]).to eq(dsc_xaddomain[:dsc_ensure].downcase.to_sym)
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xaddomain[:dsc_ensure] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ensure' do
    expect{dsc_xaddomain[:dsc_ensure] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ensure' do
    expect{dsc_xaddomain[:dsc_ensure] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ensure' do
    expect{dsc_xaddomain[:dsc_ensure] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ensure' do
    expect{dsc_xaddomain[:dsc_ensure] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xaddomain)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xaddomain)
    end

    describe "when dscmeta_import_resource is true (default) and dscmeta_module_name existing/is defined " do

      it "should compute powershell dsc test script with Invoke-DscResource" do
        expect(@provider.ps_script_content('test')).to match(/Invoke-DscResource/)
      end

      it "should compute powershell dsc test script with method Test" do
        expect(@provider.ps_script_content('test')).to match(/Method\s+=\s*'test'/)
      end

      it "should compute powershell dsc set script with Invoke-DscResource" do
        expect(@provider.ps_script_content('set')).to match(/Invoke-DscResource/)
      end

      it "should compute powershell dsc test script with method Set" do
        expect(@provider.ps_script_content('set')).to match(/Method\s+=\s*'set'/)
      end

    end

    describe "when dsc_ensure is 'present'" do

      before(:each) do
        dsc_xaddomain.original_parameters[:dsc_ensure] = 'present'
        dsc_xaddomain[:dsc_ensure] = 'present'
        @provider = described_class.provider(:powershell).new(dsc_xaddomain)
      end

      it "should update :ensure to :present" do
        expect(dsc_xaddomain[:ensure]).to eq(:present)
      end

      it "should compute powershell dsc test script in which ensure value is 'present'" do
        expect(@provider.ps_script_content('test')).to match(/ensure = 'present'/)
      end

      it "should compute powershell dsc set script in which ensure value is 'present'" do
        expect(@provider.ps_script_content('set')).to match(/ensure = 'present'/)
      end

    end

    describe "when dsc_ensure is 'absent'" do

      before(:each) do
        dsc_xaddomain.original_parameters[:dsc_ensure] = 'absent'
        dsc_xaddomain[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:powershell).new(dsc_xaddomain)
      end

      it "should update :ensure to :absent" do
        expect(dsc_xaddomain[:ensure]).to eq(:absent)
      end

      it "should compute powershell dsc test script in which ensure value is 'present'" do
        expect(@provider.ps_script_content('test')).to match(/ensure = 'present'/)
      end

      it "should compute powershell dsc set script in which ensure value is 'absent'" do
        expect(@provider.ps_script_content('set')).to match(/ensure = 'absent'/)
      end

    end

  end
end
