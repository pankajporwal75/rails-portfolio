class Text < ApplicationRecord
  SUB_CATEGORIES = {
    home: { intro: { greeting: 'Greeting', developer_name: 'Developer Name'}, about_me: { about_me_intro: 'About Me Intro', expertise_heading: 'Expertise Heading', field_of_interest: 'Field of Interest', my_passion: 'My Passion'}, links: { links_heading: 'Links Heading', links_sub_heading: 'Links Subheading'}},
    about: { who_i_am: { heading: 'Heading ', name_and_designation: 'Name and Designation', education: 'Education'}, skills: { skills_heading: 'Skills Heading', tools_heading: 'Tools Heading'}},
    projects: { project_cards: { heading: 'Heading', sub_heading: 'Sub Heading'}},
    page_footer: { footer: { footer_description: 'Footer description', copyright: 'Copyright'}}
  }

  # Enum for Sections of Keys
  enum section: {
    intro: 'Intro', about_me: 'About Me', links: 'Links',
    who_i_am: 'Who I am', skills: 'Skills',
    project_cards: 'Project Cards',
    footer: 'Footer'
  }

  # Enum for Keys
  enum key: { 
    greeting: 'Greeting', developer_name: 'Developer Name', about_me_intro: 'About Me Intro', expertise_heading: 'Expertise Heading',
    field_of_interest: 'Field of Interest', my_passion: 'My Passion', links_heading: 'Links Heading',
    links_sub_heading: 'Links Subheading', who_i_am_heading: 'Who I am Heading', name_and_designation: 'Name and Designation',
    education: 'Education', skills_heading: 'Skills Heading', tools_heading: 'Tools Heading',
    project_cards_heading: 'Project Cards Heading', project_cards_sub_heading: 'Project Cards Sub Heading',
    footer_description: 'Footer description', copyright: 'Copyright'
  }

  # Enum for Category of Keys
  enum category: { home: 'Home', about: 'About Us', projects: 'Projects', page_footer: 'Page Footer' }

  validates_presence_of :category, :key, :value
end
