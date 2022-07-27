module ApplicationHelper
  def contact_helper
    link_to('contact', 'mailto:lauraroblesinfo@gmail.com', class: 'contact-link')
  end

  def social_media_helper
    tag.p('social media')
  #   tag.div(class: 'social-media fa-2x fa-fw')
  #     = link_to '#' do
  #       %i.fa-brands.fa-facebook-square.fa-flip
  #     = link_to '#' do
  #       %i.fa-brands.fa-instagram-square.fa-flip
  #     = link_to '#' do
  #       %i.fa-brands.fa-solid.fa-square-envelope.fa-flip
  end
end
