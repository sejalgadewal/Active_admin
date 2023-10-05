# ActiveAdmin.register PersonalDetail do

#   # See permitted parameters documentation:
#   # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#   #
#   # Uncomment all parameters which should be permitted for assignment
#   #
#    permit_params :mobile, :email, :gender, :dob, :marital_status, :blood_group, :image , :video



#    filter :mobile
#   filter :email
#     filter :gender
#   filter :dob
#    filter :marital_status
#    filter :blood_group
#    filter :image
#    filter :video
   
   

#     form partial: 'form'

#         # show do
#         #   attributes_table do
#         #     row "Profile Picture" do |personal_detail|
#         #       image_tag personal_detail.image.url, alt: "Profile Picture", style: "max-width: 100px;"
#         #     end

#         #     row "Video" do |personal_detail|
#         #       video_tag personal_detail.video.url, alt: "Video", style: "max-width: 100px;"
#         #     end
            

#         #     # row :image do |ad|
#         #     #   #  image_tag url_for(ad.image)
#         #     #    image_tag ad.image_url id ad.image
#         #     # end
#         #   end
#         # end



#   #
#   # or
#   #
#   # permit_params do
#   #   permitted = [:mobile, :email, :gender, :dob, :marital_status, :blood_group]
#   #   permitted << :other if params[:action] == 'create' && current_user.admin?
#   #   permitted
#   # end
  
# end



ActiveAdmin.register PersonalDetail do
  permit_params :phone_number, :email, :gender, :dob, :marital_status, :blood_group, :image, :video
 
  filter :phone_number
  filter :email
  filter :gender
  filter :dob
  filter :marital_status
  filter :blood_group
  filter :created_at
  filter :updated_at
 
  form do |f|
  f.inputs "Image" do
  if f.object.image.present?
  f.input :image, as: :file, hint: image_tag(f.object.image_url)
  else
  f.input :image, as: :file
  end
  end
  f.inputs "Video" do
  if f.object.video.attached?
  f.input :video, as: :file, hint: video_tag(f.object.video_url, controls: true)
  else
  f.input :video, as: :file
  end
  end
 
  f.inputs "Profile Information" do
  f.input :phone_number
  f.input :email
  f.input :gender
  f.input :dob
  f.input :marital_status
  f.input :blood_group
  end 
  f.actions
  end
 
  member_action :json_show, method: :get do
    @personal_detail = PersonalDetail.find(params[:id])
    render json: @personal_detail
  end

  # ... rest of your ActiveAdmin configuration ...

  # Custom action links
  action_item :json_show, only: :show do
    link_to 'JSON Data', json_show_admin_personal_detail_path(personal_detail), target: '_blank'
  end


  show do
  panel "Image" do
  if resource.image.present?
  image_tag resource.image_url
  else
  "No image available"
  end
  end
  panel "Video" do
  if resource.video.attached?
  link_to "Video Filename: #{resource.video.filename}"
  link_to "Video URL", rails_blob_path(resource.video, disposition: "attachment"), target: "_blank"
  
  else
  "No video available"
  end
  end
  attributes_table do
  row :phone_number
  row :email
  row :gender
  row :dob
  row :marital_status
  row :blood_group
  end
 
  end
 end
 