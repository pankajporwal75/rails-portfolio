module ResumesHelper
  def get_active_status(resume)
    str = ''
    if resume.active
      str = "<button class='btn btn-success rounded-5'>Active</button>"
    end
    str.html_safe
  end
end
