# frozen_string_literal: true

#  Copyright (c) 2025, BdP and DPSG. This file is part of
#  hitobito_pfadi_de and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_pfadi_de.

module PfadiDe::PeopleController
  extend ActiveSupport::Concern

  prepended do
    before_update :clear_incomplete_legacy_data
  end

  def permitted_attrs
    super + PfadiDe::Contactable::BANK_ACCOUNT_ATTRS +
      [:pronoun, :consent_data_retention]
  end

  private

  def clear_incomplete_legacy_data
    entry.incomplete_legacy_data = false
  end
end
