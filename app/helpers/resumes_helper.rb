module ResumesHelper
  def get_active_status(record)
    str = ''
    if record.active
      str = "<button class='btn btn-success rounded-5'>Active</button>"
    else
      str = "<button class='btn btn-danger rounded-5'>Inactive</button>"
    end
    str.html_safe
  end
end
