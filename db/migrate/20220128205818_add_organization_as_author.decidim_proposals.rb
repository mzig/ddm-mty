# frozen_string_literal: true

# This migration comes from decidim_proposals (originally 20181016132225)

class AddOrganizationAsAuthor < ActiveRecord::Migration[5.2]
  def change
    official_proposals = Decidim::Proposals::Proposal.find_each.select { |proposal|
      proposal.coauthorships.count.zero?
    }

    official_proposals.each do |proposal|
      proposal.add_coauthor(proposal.organization)
    end
  end
end
