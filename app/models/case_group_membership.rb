class CaseGroupMembership < ApplicationRecord
  belongs_to :case_group
  belongs_to :casa_case
  has_one :casa_org, through: :case_group

  validate :casa_case_in_same_org

  private

  def casa_case_in_same_org
    return if casa_case.nil? || case_group.nil?
    return if casa_case.casa_org_id == case_group.casa_org_id

    errors.add(:casa_case, "must belong to the same organization as the group")
  end
end

# == Schema Information
#
# Table name: case_group_memberships
#
#  id            :bigint           not null, primary key
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  casa_case_id  :bigint           not null
#  case_group_id :bigint           not null
#
# Foreign Keys
#
#  fk_rails_...  (casa_case_id => casa_cases.id)
#  fk_rails_...  (case_group_id => case_groups.id)
#
