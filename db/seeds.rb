# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

hs2500 = Machine.find_or_create_by(name: 'HS2500')
hs2500_kits = %w(58c 66c 160c 168c 202c 210c 218c 266c 316c 508c 516c cBotV1)
hs2500_kits.each do |kit_name|
  kit = Kit.find_or_create_by(name: kit_name)
  MachineKitCompatibility.find_or_create_by(machine: hs2500, kit: kit)
end

hsx = Machine.find_or_create_by(name: 'HSX')
hsx_kits = %w(cBotV1 cBotV2 168c 310c 516c Rehyb_R1 PE_R2)
hsx_kits.each do |kit_name|
  kit = Kit.find_or_create_by(name: kit_name)
  MachineKitCompatibility.find_or_create_by(machine: hsx, kit: kit)
end

next_seq = Machine.find_or_create_by(name: "NextSeq")
next_seq_kits = %w(NEXTSEQ75 NEXTSEQ150 NEXSEQ300)
next_seq_kits.each do |kit_name|
  kit = Kit.find_or_create_by(name:kit_name)
  MachineKitCompatibility.find_or_create_by(machine: next_seq, kit: kit)
end

hs2000v3 = Machine.find_or_create_by(name: 'HS2000V3')
hs2000v3_kits = %w(cBotV1 44cSR 58c 160c 168c 202c 210c 218c Rehyb_R1Kit IndexPrimerBoxR1&PER2)
hs2000v3_kits.each do |kit_name|
  kit = Kit.find_or_create_by(name:kit_name)
  MachineKitCompatibility.find_or_create_by(machine: hs2000v3, kit: kit)
end

cost_objects = ["Core Sequencing", "Custom Sequencing", "CRSP"]
cost_objects.each do |cost_object|
  CostObject.find_or_create_by(name: cost_object)
end
