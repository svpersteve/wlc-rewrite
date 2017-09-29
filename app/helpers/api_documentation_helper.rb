module ApiDocumentationHelper
  def api_models
    [meetups, members]
  end

  private

  def meetups
    meetups = {
      name: 'Meetups',
      endpoints: {
        name: 'Index',
        path: 'path',
        example: ""
      }
    }
  end

  def members
    members = {
      name: 'Members',
      endpoints: {
        index: {
          name: 'Index',
          path: 'path',
          example: ""
        }
      }
    }
  end
end
