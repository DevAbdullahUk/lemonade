class Test < ApplicationRecord
    has_rich_text :description
    serialize :environments, Array
    belongs_to :project, class_name: 'Project'
    max_paginates_per 25
end
