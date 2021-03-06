# workaround for cross modules dependencies
master_path = File.expand_path(File.join(__FILE__, '..', '..', '..', '..', '..', 'dsc','lib'))
$:.push(master_path) if File.directory?(master_path)
require 'puppet/type/base_dsc'

Puppet::Type.newtype(:dsc_xvmswitch) do

  provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
    defaultfor :operatingsystem => :windows
  end

  @doc = %q{
    The DSC xVMSwitch resource type.
    Originally generated from the following schema.mof file:
      import/dsc_resources/dsc-resource-kit/xHyper-V/DSCResources/MSFT_xVMSwitch/MSFT_xVMSwitch.schema.mof
  }

  validate do
      fail('dsc_name is a required attribute') if self[:dsc_name].nil?
      fail('dsc_type is a required attribute') if self[:dsc_type].nil?
    end

  newparam(:dscmeta_resource_friendly_name) do
    defaultto "xVMSwitch"
  end

  newparam(:dscmeta_resource_name) do
    defaultto "MSFT_xVMSwitch"
  end

  newparam(:dscmeta_import_resource) do
    newvalues(true, false)

    munge do |value|
      provider.munge_boolean(value.to_s)
    end

    defaultto true
  end

  newparam(:dscmeta_module_name) do
    defaultto "xHyper-V"
  end

  newparam(:dscmeta_module_version) do
    defaultto "2.2.1"
  end

  newparam(:name, :namevar => true ) do
  end

  ensurable do
    newvalue(:exists?) { provider.exists? }
    newvalue(:present) { provider.create }
    newvalue(:absent)  { provider.destroy }
    defaultto :present
  end

  # Name:         Name
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_name) do
    desc "Name of the VM Switch"
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Type
  # Type:         string
  # IsMandatory:  True
  # Values:       ["External", "Internal", "Private"]
  newparam(:dsc_type) do
    desc "Type of switch"
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['External', 'external', 'Internal', 'internal', 'Private', 'private'].include?(value)
        fail("Invalid value '#{value}'. Valid values are External, Internal, Private")
      end
    end
  end

  # Name:         NetAdapterName
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_netadaptername) do
    desc "Network adapter name for external switch type"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         AllowManagementOS
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_allowmanagementos) do
    desc "Specify is the VM host has access to the physical NIC"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      provider.munge_boolean(value.to_s)
    end
  end

  # Name:         Ensure
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Present", "Absent"]
  newparam(:dsc_ensure) do
    desc "Whether switch should be present or absent"
    validate do |value|
      resource[:ensure] = value.downcase
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Present', 'present', 'Absent', 'absent'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Present, Absent")
      end
    end
  end

  # Name:         Id
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_id) do
    desc "Unique ID for the switch"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         NetAdapterInterfaceDescription
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_netadapterinterfacedescription) do
    desc "Description of the network interface"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end


end
