module ProjectsHelper
  
    def validate_uuid_format(uuid)
        uuid_regex = /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/
        uuid_regex.match?(uuid.to_s.downcase)
    end

    
    
    def get_project_id(project_uuid, project_list)
        is_valid_project_id = validate_uuid_format(project_uuid)
    
              if is_valid_project_id
                project_list
                  .filter{|project| project.projectId.eql? project_uuid}
                  &.first
                  &.id
              else 
                nil 
              end
    end

    def is_project_contains_test(test_id, project_id)
      !Test
      .where(project_Id: project_id, id: test_id)
      .empty?
    end

    def is_project_owner(user_id, project_id)

      # binding.break

      !ProjectUser
      .where(projectId: project_id, userId: user_id, accessLevel: 'owner' )
      .empty?
    end


    def is_project_guest(user_id, project_id)
      !ProjectUser
      .where(projectId: project_id, userId: user_id, accessLevel: 'guest' )
      .empty?
    end

end
