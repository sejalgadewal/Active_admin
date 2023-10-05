ActiveAdmin.register Post do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  # form do |f|
  #    input :images, as: :file, input_html: { multiple: true }
  # end
  permit_params :title, :body, :user_id, :image

  filter :title
  filter :body
    filter :user_id
  filter :image
   filter :created_at
   filter :updated_at

   form partial: 'form'

        show do
          attributes_table do
            row :title
            row :image do |ad|
               image_tag url_for(ad.image)
            end
          end
        end

#    controller do


#    def create
#      @post = Post.new(post_params)
#      @post.user = User.find(1)  # Assuming you have a way to access the current user
#      respond_to do |format|
#        if @post.save
#          format.html { redirect_to admin_post_path(@post), notice: 'Post was successfully created.' }
#          format.json { render :show, status: :created, location: admin_post_path(@post) }
#        else
#          format.html { render :new }
#          format.json { render json: @post.errors, status: :unprocessable_entity }
#        end
#      end
#    end

#   private

#    def post_params
#      params.require(:post).permit(:title, :body, :user_id, images: [])
#    end
#  end



  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :body, :user_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end



# ActiveAdmin.register Post do

#   # See permitted parameters documentation:
#   # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#   #
#   # Uncomment all parameters which should be permitted for assignment
#   #
#   permit_params :title, :body, :user_id, :image
#   filter :title
#   filter :body
#   filter :user_id
#   filter :image
#   filter :created_at
#   filter :updated_at

#   form partial: 'form'

#     show do
#       attributes_table do
#         row :title
#         row :image do |ad|
#           image_tag url_for(ad.image)
#         end
#       end
#     end
#   #
#   # or
#   #
#   # permit_params do
#     # permitted = [:title, :body, :user_id]
#   #   permitted << :other if params[:action] == 'create' && current_user.admin?
#   #   permitted
#   # end
#   controller do
#   def create
#     @post = Post.new(post_params)
#     @post.user = User.find(1)  # Assuming you have a way to access the current user

#     respond_to do |format|
#       if @post.save
#         format.html { redirect_to admin_post_path(@post), notice: 'Post was successfully created.' }
#         format.json { render :show, status: :created, location: admin_post_path(@post) }
#       else
#         format.html { render :new }
#         format.json { render json: @post.errors, status: :unprocessable_entity }
#       end
#     end
#   end

#   private

#   def post_params
#     params.require(:post).permit(:title, :body, :user_id, :image)
#   end
# end

  
# end